# Project Evidence

This directory contains permanent evidence for the DevOps CI/CD Health API implementation.

## Evidence Checklist

| Requirement | Evidence |
|---|---|
| `/health` endpoint response | `outputs/health-response.txt` |
| Docker healthy status and non-root user | `outputs/docker-status.txt` |
| SonarQube Quality Gate passed | `outputs/quality-gate.json` |
| Trivy critical vulnerability scan | `outputs/trivy-critical.txt` |
| Trivy full vulnerability report | `outputs/trivy-full.txt` |
| Git branches | `outputs/git-branches.txt` |
| Git commit history | `outputs/git-history.txt` |
| Git release tags | `outputs/git-tags.txt` |
| Successful CI/CD pipeline | GitHub Actions workflow history |
| Published Docker image | GitHub Container Registry package |

## 1. Health Endpoint

Evidence:

- [Health response](outputs/health-response.txt)

Expected response:

```json
{
  "status": "healthy"
}
