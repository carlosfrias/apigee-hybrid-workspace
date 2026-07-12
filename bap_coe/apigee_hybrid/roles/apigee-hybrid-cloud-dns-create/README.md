# apigee-hybrid-cloud-dns-create

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [DNS](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#dns).

## What this role does

Creates a Cloud DNS managed zone and adds A-record transaction.

## Why it matters in production

Ingress endpoints must be reachable by a stable FQDN. DNS transactions must be handled atomically to avoid partial record states.

## Skills demonstrated

- Cloud DNS managed zones and atomic record-set transactions with abort/retry handling.

## Key variables

`DEFAULT_EXTERNAL_IP_DESCRIPION`, `DEFAULT_GCP_CLOUD_DNS_DESCRIPTION`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
