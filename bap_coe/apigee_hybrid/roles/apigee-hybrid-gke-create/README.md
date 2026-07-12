# apigee-hybrid-gke-create

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [K8s Provisioning](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#k8s-provisioning).

## What this role does

Provisions a regional or zonal GKE cluster with Apigee-Hybrid-compatible settings.

## Why it matters in production

Apigee Hybrid is a stateful, multi-service platform running inside Kubernetes. The cluster needs correct node pools, network tags, and firewall rules; a kubeconfig lifecycle that does not leak stale contexts; and region-aware provisioning for incremental multi-region topologies.

## Skills demonstrated

- GKE cluster lifecycle — regional vs. zonal topology, node pool sizing, Apigee-Hybrid-compatible cluster shape.

## Key variables

`DEFAULT_NODE_COUNT`, `DEFAULT_MACHINE_TYPE`, `DEFAULT_SERVICE_ACCOUNT_NAME`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml), [`tasks/regional.yml`](tasks/regional.yml), and [`tasks/zonal.yml`](tasks/zonal.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-playbook-installation-single-region`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-single-region), [`apigee-opdk-playbook-installation-two-regions`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-two-regions), [`apigee-opdk-playbook-installation-third-region`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-third-region). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
