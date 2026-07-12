# apigee-hybrid-apigeectl-init

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [apigeectl Lifecycle](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#apigeectl-lifecycle).

## What this role does

Initializes the apigeectl workspace.

## Why it matters in production

apigeectl is the bridge between the Apigee management plane and the Kubernetes runtime. Its overrides.yml contains topology decisions that determine production behavior.

## Skills demonstrated

- apigeectl lifecycle management — workspace init, overrides.yml generation, multi-region prep/clear, and version discipline.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
