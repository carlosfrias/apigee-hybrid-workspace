# apigee-hybrid-cluster-credentials

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [K8s Provisioning](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#k8s-provisioning).

## What this role does

Generates and caches kubeconfig files for provisioned clusters.

## Why it matters in production

Apigee Hybrid is a stateful, multi-service platform running inside Kubernetes. The cluster needs correct node pools, network tags, and firewall rules; a kubeconfig lifecycle that does not leak stale contexts; and region-aware provisioning for incremental multi-region topologies.

## Skills demonstrated

- Kubeconfig artifact management and secure credential caching for multi-cluster control.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
