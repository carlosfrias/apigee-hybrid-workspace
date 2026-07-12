# apigee-hybrid-apigeectl-configure

> **Part of the Apigee Hybrid on Kubernetes automation collection.** See the portfolio hub [`apigee-hybrid-workspace`](https://github.com/carlosfrias/apigee-hybrid-workspace) for the full business-value story, and the group writeup [apigeectl Lifecycle](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/README.md#apigeectl-lifecycle).

## What this role does

Generates overrides.yml from non-prod/prod templates.

## Why it matters in production

apigeectl is the bridge between the Apigee management plane and the Kubernetes runtime. Its overrides.yml contains topology decisions that determine production behavior.

## Skills demonstrated

- apigeectl lifecycle management — workspace init, overrides.yml generation, multi-region prep/clear, and version discipline.

## Key variables

`DEFAULT_KMS_ENCRYPTION_KEY`, `DEFAULT_KVM_ENCRYPTION_KEY`, `DEFAULT_CACHE_ENCRYPTION_KEY`, `DEFAULT_RUNTIME_RESOURCES_REQUESTS_CPU`, `DEFAULT_RUNTIME_RESOURCES_REQUESTS_MEMORY`, `DEFAULT_CASSANDRA_REPLICA_COUNT`, `DEFAULT_CASSANDRA_RESOURCES_REQUESTS_CPU`, `DEFAULT_CASSANDRA_RESOURCES_REQUESTS_MEMORY`, `DEFAULT_CASSANDRA_MAX_HEAP_SIZE`, `DEFAULT_CASSANDRA_HEAP_NEW_SIZE`, `DEFAULT_CASSANDRA_STORAGE_STORAGECLASS`, `DEFAULT_CASSANDRA_STORAGE_CAPACITY`

## Evaluator entry point

Start with [`tasks/main.yml`](tasks/main.yml) in this role directory.

**Evolution from OPDK / standalone repos.** This capability has roots in the OPDK-era work: [`apigee-opdk-setup-silent-installation-config`](https://github.com/carlosfrias/apigee-opdk-setup-silent-installation-config), [`apigee-opdk-setup-component`](https://github.com/carlosfrias/apigee-opdk-setup-component). The pattern migrated from host-level operations to Kubernetes/GCP APIs.

---

*Sole-authored by Carlos Frias. See [LICENSE](../../../../LICENSE).*
