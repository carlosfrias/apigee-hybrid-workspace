# apigee-hybrid-org-create

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Control Plane](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#control-plane).

## What this role does

Creates the Apigee organization via the management API.

## Why it matters in production

The control plane is the boundary between API management and runtime traffic. Creating these objects incorrectly or in the wrong order means APIs cannot be deployed.

## Skills demonstrated

- Apigee control-plane provisioning — org/env/group hierarchy and async long-running operation polling.

## Key variables

`DEFAULT_ORG_DESCRIPTION`, `DEFAULT_RUNTIMETYPE`, `DEFAULT_ORG_CREATE_TIMEOUT`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-org`](https://github.com/carlosfrias/apigee-opdk-setup-org), [`apigee-opdk-setup-org-config`](https://github.com/carlosfrias/apigee-opdk-setup-org-config), [`apigee-opdk-setup-provisioning`](https://github.com/carlosfrias/apigee-opdk-setup-provisioning). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
