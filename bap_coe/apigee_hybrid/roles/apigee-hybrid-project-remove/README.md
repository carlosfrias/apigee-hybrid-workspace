# apigee-hybrid-project-remove

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [GCP Project / IAM](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#gcp-project-iam).

## What this role does

Removes the host GCP project.

## Why it matters in production

Apigee Hybrid requires many GCP services to be enabled before cluster or runtime work can begin. IAM bindings must be correct for runtime service accounts. Firewall rules must be region-aware.

## Skills demonstrated

- GCP project governance and ordered API enablement for Apigee Hybrid prerequisites.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
