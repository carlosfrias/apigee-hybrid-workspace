# apigee-hybrid-kubectl-cert-manager-delete

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Ingress / TLS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#ingress-tls).

## What this role does

Removes cert-manager from the cluster.

## Why it matters in production

API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate.

## Skills demonstrated

- cert-manager lifecycle on Kubernetes for automated TLS certificate management.

## Key variables

`DEFAULT_CERT_MANAGER_VERSION`, `DEFAULT_KUBECTL_VERSION`, `DEFAULT_KUBECTL_DOWNLOAD_URL`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
