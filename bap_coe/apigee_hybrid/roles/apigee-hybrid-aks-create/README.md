# apigee-hybrid-aks-create

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [K8s Provisioning](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#k8s-provisioning).

## What this role does

Provisions an AKS cluster for Azure-based Apigee Hybrid deployments.

## Why it matters in production

Apigee Hybrid is a stateful, multi-service platform running inside Kubernetes. The cluster needs correct node pools, network tags, and firewall rules; a kubeconfig lifecycle that does not leak stale contexts; and region-aware provisioning for incremental multi-region topologies.

## Skills demonstrated

- AKS provisioning — applying the same Apigee Hybrid cluster contract on Azure.

## Key variables

`DEFAULT_AKS_NODE_COUNT`, `DEFAULT_AKS_MACHINE_TYPE`, `DEFAULT_KUBERNETES_VERSION`, `DEFAULT_SERVICE_ACCOUNT_NAME`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
