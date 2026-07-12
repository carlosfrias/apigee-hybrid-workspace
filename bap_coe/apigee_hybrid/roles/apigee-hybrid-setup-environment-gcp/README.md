# apigee-hybrid-setup-environment-gcp

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Operator Environment](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#operator-environment).

## What this role does

Installs/configures GCP CLI and credentials.

## Why it matters in production

Apigee Hybrid deployments are controlled from a jump machine or CI/CD runner. Inconsistent control hosts produce inconsistent playbook results.

## Skills demonstrated

- Apigee control-plane provisioning — org/env/group hierarchy and async long-running operation polling.
- Reproducible control-host tooling — CLI version management and credential hygiene for GCP, Kubernetes, Azure, and Docker.

## Key variables

`DEFAULT_SYSTEM_TOOLS`, `DEFAULT_GCP_SYSTEM_TOOLS`, `DEFAULT_APT_REPOSITORIES`, `DEFAULT_APT_REPOSITORIES_KEYS`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-ansible-controller`](https://github.com/carlosfrias/apigee-opdk-setup-ansible-controller). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
