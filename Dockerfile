# syntax=docker/dockerfile:1

ARG NODE_VERSION=24-alpine

# ---------------------------------------------------
# Stage 1: Install all dependencies
# ---------------------------------------------------
FROM node:${NODE_VERSION} AS dependencies

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci


# ---------------------------------------------------
# Stage 2: Run linting and automated tests
# ---------------------------------------------------
FROM dependencies AS test

COPY . .

RUN npm run lint
RUN npm test -- --runInBand


# ---------------------------------------------------
# Stage 3: Install production dependencies only
# ---------------------------------------------------
FROM dependencies AS production-dependencies

RUN npm ci --omit=dev


# ---------------------------------------------------
# Stage 4: Create final production image
# ---------------------------------------------------
FROM node:${NODE_VERSION} AS production

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY --from=production-dependencies \
    --chown=node:node \
    /app/node_modules \
    ./node_modules

COPY --from=test \
    --chown=node:node \
    /app/package.json \
    /app/package-lock.json \
    ./

COPY --from=test \
    --chown=node:node \
    /app/src \
    ./src

# Remove package managers from the final runtime image.
# The application starts directly with Node.js, so these tools
# are not required in production.
RUN rm -rf \
      /usr/local/lib/node_modules/npm \
      /usr/local/lib/node_modules/corepack \
      /opt/yarn-v1.22.22 \
    && rm -f \
      /usr/local/bin/npm \
      /usr/local/bin/npx \
      /usr/local/bin/corepack \
      /usr/local/bin/yarn \
      /usr/local/bin/yarnpkg

USER node

EXPOSE 3000

HEALTHCHECK \
    --interval=30s \
    --timeout=5s \
    --start-period=5s \
    --retries=3 \
    CMD node -e "fetch('http://127.0.0.1:' + (process.env.PORT || 3000) + '/health').then(async (response) => process.exit(response.ok && (await response.json()).status === 'healthy' ? 0 : 1)).catch(() => process.exit(1))"

CMD ["node", "src/server.js"]
