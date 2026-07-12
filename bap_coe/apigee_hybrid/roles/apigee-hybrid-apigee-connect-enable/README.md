# apigee-hybrid-apigee-connect-enable

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Self-healing / Connect](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#self-healing-connect).

## What this role does

Enables the Apigee Connect bridge between management plane and runtime cluster.

## Why it matters in production

Apigee Hybrid assumes the control plane has the right IAM bindings. Those bindings surface only at apply time. This group encodes the recovery path so the apply itself fixes the binding and retries.

## Skills demonstrated

- Apigee Connect bridge configuration between management plane and runtime cluster.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
