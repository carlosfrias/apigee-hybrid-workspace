# apigee-hybrid-tls-certs-destroy

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Ingress / TLS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#ingress-tls).

## What this role does

Destroys TLS certificates.

## Why it matters in production

API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate.

## Skills demonstrated

- PKI on Kubernetes — handling both customer-provided CA certificates and self-signed lab certificates with OpenSSL modules.

## Key variables

`DEFAULT_CSR_COMMON_NAME`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
