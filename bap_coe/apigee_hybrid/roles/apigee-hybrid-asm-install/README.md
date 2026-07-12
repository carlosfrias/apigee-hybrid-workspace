# apigee-hybrid-asm-install

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Anthos Service Mesh](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#anthos-service-mesh).

## What this role does

Downloads, installs, and configures ASM with revision-tagged Istio and kpt packages.

## Why it matters in production

ASM is the data plane between Apigee Hybrid runtime components. It must be installed with a specific revision tag so upgrades can be rolled out incrementally.

## Skills demonstrated

- Anthos Service Mesh installation — revision-tagged Istio, kpt package reconciliation, canary-ready service mesh.

## Key variables

`DEFAULT_CERT_MANAGER_VERSION`, `DEFAULT_AUTO_INJECTION_NAMESPACE`, `DEFAULT_ASM_PROFILE_NAME`, `DEFAULT_ASM_DOWNLOAD_BASE_URL`, `DEFAULT_CSM_DOWNLOAD_BASE_URL`, `ASM_SYSTEM_DEPENDENCIES`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) and [`tasks/install-istio-gke.yml`](tasks/install-istio-gke.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-mirror-nginx`](https://github.com/carlosfrias/apigee-opdk-setup-mirror-nginx), [`apigee-opdk-setup-edge-sso-config`](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
