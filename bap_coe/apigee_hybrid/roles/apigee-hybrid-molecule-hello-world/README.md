# apigee-hybrid-molecule-hello-world

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [Test Harness](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#test-harness).

## What this role does

Minimal Molecule scenario used as a template for other roles.

## Why it matters in production

A 42-role collection without tests is unmaintainable. Molecule allows each role to be tested in isolation.

## Skills demonstrated

- Collection-quality testing with Molecule — converge/destroy/verify discipline for Ansible roles.

## Key variables

See `defaults/main.yml`.

## Evaluator entry point

Start with [`molecule/default/converge.yml`](molecule/default/converge.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This is a cloud-native capability introduced for Apigee Hybrid; there is no direct OPDK predecessor.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
