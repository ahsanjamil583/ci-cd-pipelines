# Project Evidence

This directory contains evidence for the DevOps CI/CD Health API implementation.

## Evidence Checklist

| Requirement | Evidence |
|---|---|
| `/health` endpoint response | `outputs/health-response.txt` and screenshot 01 |
| Docker healthy status | `outputs/docker-status.txt` and screenshot 02 |
| SonarQube Quality Gate passed | `outputs/quality-gate.json` and screenshot 03 |
| Trivy vulnerability scan | `outputs/trivy-critical.txt` and screenshot 04 |
| GitHub Actions successful run | Screenshot 05 |
| GHCR published image | Screenshot 06 |
| Git branches and commits | Output files and screenshot 07 |

## 1. Health Endpoint Response

Output:

- [Health response](outputs/health-response.txt)

Screenshot:

![Health endpoint response](screenshots/01-health-endpoint.png)

## 2. Docker Healthy Status

Output:

- [Docker status](outputs/docker-status.txt)

Screenshot:

![Docker healthy status](screenshots/02-docker-healthy.png)

## 3. SonarQube Quality Gate

Output:

- [Quality Gate JSON](outputs/quality-gate.json)

Screenshot:

![SonarQube Quality Gate](screenshots/03-sonarqube-quality-gate.png)

## 4. Trivy Security Scan

Output:

- [Critical vulnerability scan](outputs/trivy-critical.txt)
- [Full vulnerability report](outputs/trivy-full.txt)

Screenshot:

![Trivy vulnerability scan](screenshots/04-trivy-report.png)

## 5. GitHub Actions

Screenshot:

![Successful GitHub Actions run](screenshots/05-github-actions-success.png)

The successful run must show:

- Lint and test
- Build and verify container
- SonarQube Quality Gate
- GHCR publishing for a version-tag run

## 6. GitHub Container Registry

Screenshot:

![GHCR published image](screenshots/06-ghcr-published-image.png)

Expected image tags:

```text
v1.0.0
<full-commit-sha>
```

## 7. Git Branches, Commits, and Tags

Outputs:

- [Git branches](outputs/git-branches.txt)
- [Git commit history](outputs/git-history.txt)
- [Git release tags](outputs/git-tags.txt)

Screenshot:

![Git branches and commits](screenshots/07-git-history.png)
