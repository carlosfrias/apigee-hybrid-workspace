# apigee-hybrid-ingressgateway-expose-endpoint

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Ingress / TLS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#ingress-tls).

## What this role does

Exposes the ingress gateway via a LoadBalancer service.

## Why it matters in production

API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate.

## Skills demonstrated

- Kubernetes LoadBalancer service exposure and ingress gateway operations for external API traffic.

## Key variables

`DEFAULT_ORG_DESCRIPTION`, `DEFAULT_RUNTIMETYPE`, `DEFAULT_ORG_CREATE_TIMEOUT`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-mirror-nginx`](https://github.com/carlosfrias/apigee-opdk-setup-mirror-nginx), [`apigee-opdk-setup-edge-sso-config`](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
