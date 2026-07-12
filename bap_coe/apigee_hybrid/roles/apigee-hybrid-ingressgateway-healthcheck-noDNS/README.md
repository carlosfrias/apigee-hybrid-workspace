# apigee-hybrid-ingressgateway-healthcheck-noDNS

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Ingress / TLS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#ingress-tls).

## What this role does

Health check that does not require DNS to be provisioned yet.

## Why it matters in production

API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate.

## Skills demonstrated

- Kubernetes LoadBalancer service exposure and ingress gateway operations for external API traffic.
- Operational verification — health checks with and without DNS for staged validation.

## Key variables

`DEFAULT_ORG_DESCRIPTION`, `DEFAULT_RUNTIMETYPE`, `DEFAULT_ORG_CREATE_TIMEOUT`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
