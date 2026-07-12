# apigee-hybrid-apigeectl-apply

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Self-healing / Connect](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#self-healing-connect).

## What this role does

Runs apigeectl apply, parses stderr for IAM errors, grants missing roles, and retries.

## Why it matters in production

Apigee Hybrid assumes the control plane has the right IAM bindings. Those bindings surface only at apply time. This group encodes the recovery path so the apply itself fixes the binding and retries.

## Skills demonstrated

- Failure-aware reconciliation — parsing runtime stderr to diagnose and auto-remediate missing IAM bindings.
- Cross-layer debugging — GCP IAM fixes for Kubernetes-reported failures.
- Idempotent remediation using gcloud project IAM policy bindings in Ansible rescue blocks.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-validate`](https://github.com/carlosfrias/apigee-opdk-setup-validate), [`apigee-opdk-setup-status`](https://github.com/carlosfrias/apigee-opdk-setup-status), [`apigee-opdk-setup-default-settings`](https://github.com/carlosfrias/apigee-opdk-setup-default-settings). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
