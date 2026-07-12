# apigee-hybrid-project-services-enable

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [GCP Project / IAM](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#gcp-project-iam).

## What this role does

Enables the GCP APIs required by Apigee Hybrid.

## Why it matters in production

Apigee Hybrid requires many GCP services to be enabled before cluster or runtime work can begin. IAM bindings must be correct for runtime service accounts. Firewall rules must be region-aware.

## Skills demonstrated

- GCP project governance and ordered API enablement for Apigee Hybrid prerequisites.

## Key variables

`DEFAULT_GCLOUD_PROJECT_SERVICES`, `DEFAULT_GCLOUD_PROJECT_ROLE_BINDING`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-playbook-setup-ansible`](https://github.com/carlosfrias/apigee-opdk-playbook-setup-ansible). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
