# apigee-hybrid-kubectl-ingressgateway

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Ingress / TLS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#ingress-tls).

## What this role does

Helper tasks for ingress gateway kubectl operations.

## Why it matters in production

API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate.

## Skills demonstrated

- Kubernetes LoadBalancer service exposure and ingress gateway operations for external API traffic.

## Key variables

`DEFAULT_NODE_COUNT`, `DEFAULT_MACHINE_TYPE`, `DEFAULT_SERVICE_ACCOUNT_NAME`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
