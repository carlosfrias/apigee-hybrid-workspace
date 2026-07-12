# apigee-hybrid-kubectl-context-delete

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [K8s Provisioning](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#k8s-provisioning).

## What this role does

Removes stale kubectl contexts to avoid accidental operations against deleted clusters.

## Why it matters in production

Apigee Hybrid is a stateful, multi-service platform running inside Kubernetes. The cluster needs correct node pools, network tags, and firewall rules; a kubeconfig lifecycle that does not leak stale contexts; and region-aware provisioning for incremental multi-region topologies.

## Skills demonstrated

- Clean teardown that removes local kubectl contexts, preventing accidental operations against deleted clusters.

## Key variables

`DEFAULT_NODE_COUNT`, `DEFAULT_MACHINE_TYPE`, `DEFAULT_SERVICE_ACCOUNT_NAME`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
