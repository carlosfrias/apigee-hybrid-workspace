# Skills Assessment — apigee-hybrid-workspace

> **Portfolio hub.** This collection is the flagship of the Apigee Hybrid / Kubernetes automation corpus and the largest single body of work in the corpus. Its skills assessment doubles as the **portfolio entry point** — the business reader can start here and follow the curated links to the specialized assessments across the related repositories.

---

## Skill domain

**Apigee Hybrid on Kubernetes — full lifecycle automation** (the cloud-native tier of the Apigee platform-operations expertise).

Ansible is the medium. The durable expertise is the **Kubernetes-native platform lifecycle**: provisioning GKE/AKS, installing Anthos Service Mesh, driving the `apigeectl` runtime, reconciling with failure-aware self-healing, and coordinating multi-region topologies — all composed as a distributable, versioned collection.

---

## Why this collection is notable

- **The largest body of work in the corpus.** 2,691 commits across 2020–2025, 42 roles, packaged as a versioned Ansible collection (`bap_coe.apigee_hybrid` v1.0.0) — beginning ~1 year after Apigee Hybrid GA.
- **A deliberate distribution-architecture migration.** Successor to the `apigee-edge-opdk` monorepo; moves from clone-and-edit roles to an `ansible-galaxy`-installable collection — matching how the Ansible ecosystem and Apigee Hybrid itself matured.
- **Error-driven IAM self-healing.** `apigeectl-apply` parses `apigeectl` stderr and auto-grants missing GCP IAM roles (`apigeeconnect.Agent`, `apigee.runtimeAgent`) in a rescue block, then retries — a production failure mode encoded into the automation.
- **Multi-region, multi-cloud.** GKE + AKS, Anthos Service Mesh (revision-tagged Istio, kpt), dedicated multi-region configure/prep/clear roles.
- **Collection-quality discipline.** Molecule test harnesses across setup-environment, apigee-version, ip-address, and hello-world roles.

---

## Expertise demonstrated

> The engineering evidence lives in the [project README →](README.md). What follows is the skills assessment for the business reader.

- **Kubernetes / GKE / AKS platform engineering** — cluster create/delete, credential bootstrapping, context management, cert-manager lifecycle, ingress gateway exposure and health checks.
- **Anthos Service Mesh / Istio** — ASM install with revision-tagged Istio and kpt package reconciliation.
- **Apigee Hybrid runtime lifecycle** — the full `apigeectl` init→configure→apply→checkready sequence, including multi-region configure with settings prep and clear.
- **Failure-aware, self-healing reconciliation** — `apigeectl-apply` parses stderr and auto-grants missing GCP IAM roles before retrying. This is the standout: a real production failure mode (missing IAM bindings surfacing only at apply time) encoded as automated remediation, not a runbook step.
- **GCP IAM & project management** — project create/remove, service enablement, IAM role grants, service-account-driven auth.
- **Multi-region topology coordination** — dedicated multi-region configure/prep/clear roles; region-aware firewall enablement.
- **TLS / PKI on K8s** — cert-manager install/delete, TLS cert create/destroy, ingress gateway TLS exposure.
- **Apigee control-plane provisioning** — org/env/group create + attach, URI synchronizer, Apigee Connect enablement.
- **Distributable collection architecture** — packaged as `bap_coe.apigee_hybrid` consumable via `ansible-galaxy`, not a clone-and-edit monorepo. The distribution-mechanism decision is itself an engineering judgment: matching how the ecosystem matured.

---

## How this shows the expertise

This collection is the **cloud-native successor** to the on-prem [`apigee-edge-opdk`](https://github.com/carlosfrias/apigee-edge-opdk) framework. The same framework thinking — model the platform as an object graph, converge it idempotently — is transposed from an on-prem planet (Management Server REST API) onto Kubernetes + Anthos Service Mesh + Apigee Hybrid. The ten-year arc from OPDK (2015–16) to Hybrid (2020–25) is itself a credential: the expertise migrated across two distribution architectures and two runtime models while the underlying framework discipline held.

The IAM self-healing on `apigeectl-apply` is the clearest single signal: it is not "an Ansible role" — it is a production failure mode (missing `apigeeconnect.Agent` / `apigee.runtimeAgent` bindings surfacing only at apply time) observed in the field, diagnosed, and encoded as automated remediation with a rescue-and-retry. That is systems engineering, with Ansible as the medium.

---

## Portfolio hub — related expertise across the corpus

This collection is the entry point. The expertise below is evidenced in the related repositories, each with its own skills assessment:

### Apigee OPDK / on-prem platform operations
| Skill | Repository | Assessment |
|-------|-----------|-----------|
| OPDK framework (flagship, 120-role monorepo) | [`apigee-edge-opdk`](https://github.com/carlosfrias/apigee-edge-opdk) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-edge-opdk/blob/main/SKILLS-ASSESSMENT.md) *(pending retrofit)* |
| Rolling upgrade / DR / traffic fencing | [`apigee-opdk-playbook-maintenance-opdk-upgrade`](https://github.com/carlosfrias/apigee-opdk-playbook-maintenance-opdk-upgrade) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-playbook-maintenance-opdk-upgrade/blob/main/SKILLS-ASSESSMENT.md) ✅ |
| Cassandra cluster rebuild | [`apigee-opdk-cassandra-rebuild`](https://github.com/carlosfrias/apigee-opdk-cassandra-rebuild) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-cassandra-rebuild/blob/main/SKILLS-ASSESSMENT.md) ✅ |
| Postgres HA / controlled switchover | [`apigee-opdk-setup-postgres-failover`](https://github.com/carlosfrias/apigee-opdk-setup-postgres-failover) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-setup-postgres-failover/blob/main/SKILLS-ASSESSMENT.md) ✅ |
| SAML SSO / dual-keypair | [`apigee-opdk-setup-edge-sso-config`](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config/blob/main/SKILLS-ASSESSMENT.md) ✅ |
| OpenLDAP / OS security | [`apigee-opdk-setup-os-openldap`](https://github.com/carlosfrias/apigee-opdk-setup-os-openldap) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-setup-os-openldap/blob/main/SKILLS-ASSESSMENT.md) ✅ |
| Analytics topology lifecycle | [`apigee-opdk-setup-analytics-group-add`](https://github.com/carlosfrias/apigee-opdk-setup-analytics-group-add) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-setup-analytics-group-add/blob/main/SKILLS-ASSESSMENT.md) *(pending v3)* |
| Multi-datacenter expansion | [`apigee-opdk-playbook-maintenance-expand-region`](https://github.com/carlosfrias/apigee-opdk-playbook-maintenance-expand-region) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-opdk-playbook-maintenance-expand-region/blob/main/SKILLS-ASSESSMENT.md) *(pending v3)* |

### Apigee tooling
| Skill | Repository | Assessment |
|-------|-----------|-----------|
| Gradle plugin / proxy management | [`apigee-gradle-plugin`](https://github.com/carlosfrias/apigee-gradle-plugin) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/apigee-gradle-plugin/blob/main/SKILLS-ASSESSMENT.md) *(pending v3)* |

### AI orchestration
| Skill | Repository | Assessment |
|-------|-----------|-----------|
| A2A v1.0 spec conformance | [`pi-a2a-communication`](https://github.com/carlosfrias/pi-a2a-communication) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/pi-a2a-communication/blob/main/SKILLS-ASSESSMENT.md) *(pending retrofit)* |

### Self-hosted infrastructure
| Skill | Repository | Assessment |
|-------|-----------|-----------|
| Docker Compose + Ansible lifecycle | [`nextcloud`](https://github.com/carlosfrias/nextcloud) | [SKILLS-ASSESSMENT.md →](https://github.com/carlosfrias/nextcloud/blob/main/SKILLS-ASSESSMENT.md) *(pending v3)* |

> *(pending retrofit)* = repo has a pushed v2 README; the skills assessment will be split out as that repo is retrofitted to v3. *(pending v3)* = repo is drafted under v2 (Batch 4) and will be re-drafted under v3 with its own `SKILLS-ASSESSMENT.md`.

---

## Provenance

Sole-authored and maintained by **Carlos Frias**. This skills assessment is the portfolio-hub companion to the engineering [README →](README.md). For the full engineering detail — role inventory, architecture, and usage — see the project README.

## License

See [LICENSE](./LICENSE).