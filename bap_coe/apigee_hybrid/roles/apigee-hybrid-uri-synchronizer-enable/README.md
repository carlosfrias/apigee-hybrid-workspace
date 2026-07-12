# apigee-hybrid-uri-synchronizer-enable

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Control Plane](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#control-plane).

## What this role does

Enables URI synchronization between management plane and runtime.

## Why it matters in production

The control plane is the boundary between API management and runtime traffic. Creating these objects incorrectly or in the wrong order means APIs cannot be deployed.

## Skills demonstrated

- URI synchronization between Apigee management plane and runtime environments.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
