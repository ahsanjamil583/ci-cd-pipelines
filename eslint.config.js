const js = require("@eslint/js");
const globals = require("globals");

module.exports = [
  {
    ignores: [
      "node_modules/**",
      "coverage/**",
    ],
  },

  js.configs.recommended,

  {
    files: [
      "src/**/*.js",
      "*.js",
    ],

    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "commonjs",

      globals: {
        ...globals.node,
      },
    },

    rules: {
      semi: [
        "error",
        "always",
      ],

      quotes: [
        "error",
        "double",
      ],

      "no-console": "off",
    },
  },

  {
    files: [
      "tests/**/*.js",
    ],

    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "commonjs",

      globals: {
        ...globals.node,
        ...globals.jest,
      },
    },

    rules: {
      semi: [
        "error",
        "always",
      ],

      quotes: [
        "error",
        "double",
      ],
    },
  },
];
