# apigee-hybrid-workspace — Apigee Hybrid on Kubernetes Automation Toolkit

> **An Ansible collection (`bap_coe.apigee_hybrid`) that automates the full lifecycle of Apigee Hybrid on Kubernetes** — provision the cluster, install the runtime, configure multi-region, manage TLS and ingress, provision orgs/envs, and converge it all idempotently across GKE and AKS.

> [!NOTE]
> **Start here for the portfolio story** — this repo is the hub for the Apigee Hybrid / Kubernetes automation corpus and routes to the rest of the expertise. See the [skills assessment →](SKILLS-ASSESSMENT.md) for the expertise applied, or browse the related repos below.

> **Evaluator? Start here:** This repo is the portfolio hub. For the business-value breakdown of every role group, see the [SKILLS-ASSESSMENT.md →](SKILLS-ASSESSMENT.md). For the engineering detail, see the [Capability map explained →](#capability-map-explained-business-value-by-group) below.

This is the cloud-native successor to [`apigee-edge-opdk`](https://github.com/carlosfrias/apigee-edge-opdk). Where the OPDK framework modeled an on-prem **planet** as an object graph and converged it via the Apigee management REST API, this toolkit transposes the same framework thinking onto **Kubernetes + Anthos Service Mesh + Apigee Hybrid** — packaged as a distributable Ansible collection rather than a monorepo.

> **Disclaimer:** This is not a Google product and is not supported by Apigee. It is a community toolkit provided as-is. See [LICENSE](./LICENSE).
>
> **Authorship:** Authored and maintained in full by **Carlos Frias** (sole author). The `bap_coe` namespace is retained as the collection's technical identifier; no other contributors participated.

---

## What the toolkit actually does

It drives the complete Apigee Hybrid lifecycle as composable, idempotent roles:

- **Provision the Kubernetes platform** — `apigee-hybrid-gke-create` / `-aks-create` (and `-delete`), `apigee-hybrid-project-create` / `-services-enable`, `apigee-hybrid-cluster-credentials`, `apigee-hybrid-cloud-dns-create`.
- **Install the Anthos Service Mesh** — `apigee-hybrid-asm-install` (revision-tagged Istio, kpt packages).
- **Drive `apigeectl`** — `apigee-hybrid-apigeectl-{init,configure,apply,checkready,download,dir-structure,version}`, with `configure-multi-region-{prep,clear-settings}` for multi-region topologies.
- **Reconcile, with self-healing** — `apigee-hybrid-apigeectl-apply` parses `apigeectl` stderr and, when IAM permissions are missing, **auto-grants `roles/apigeeconnect.Agent` and `roles/apigee.runtimeAgent`** in a rescue block, then retries.
- **Expose and verify the runtime** — `apigee-hybrid-ingressgateway-{expose-endpoint,healthcheck,healthcheck-noDNS}`, `apigee-hybrid-kubectl-{ingressgateway,cert-manager-install,cert-manager-delete,context-delete}`, `apigee-hybrid-tls-certs-{create,destroy}`.
- **Provision the control plane** — `apigee-hybrid-{org,env,group}-{create,attach}`, `apigee-hybrid-uri-synchronizer-enable`, `apigee-hybrid-apigee-connect-enable`, `apigee-hybrid-apigee-cluster-ready-check`.
- **Wire networking and firewalling** — `apigee-hybrid-firewall-region-enable`, `apigee-hybrid-ip-address`.
- **Prepare the operator environment** — `apigee-hybrid-setup-environment-{gcp,kubernetes,az,docker}`.

---

## Collection architecture

```
bap_coe/apigee_hybrid/          ← the Ansible collection (namespace.bap_coe, name.apigee_hybrid)
├── galaxy.yml                  ← collection metadata (v1.0.0)
├── roles/                      ← 42 roles (provision, asm, apigeectl, ingress, control-plane, env)
├── playbooks/                  ├── molecule/  (test harness)
│   ├── resources/              ├── utils/     ├── variables/  └── archive/
├── plugins/
└── meta/
```

**Why a collection (vs. the OPDK monorepo)?** The OPDK era distributed roles as individual Galaxy repos composed via `requirements.yml`. The Hybrid era consolidates into a single versioned collection consumable through `ansible-galaxy install` — a deliberate shift in **distribution architecture** to match how the Ansible ecosystem matured and how Apigee Hybrid itself is released.

---

## Capability map (42 roles)

For the business value, production context, and evolution from the OPDK / standalone repos behind each group, see [Capability map explained](#capability-map-explained-business-value-by-group) below.

| Group | Roles | Purpose |
|-------|-------|---------|
| [**K8s Provisioning**](#k8s-provisioning) | [`apigee-hybrid-gke-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-gke-create/), [`apigee-hybrid-gke-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-gke-delete/), [`apigee-hybrid-aks-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-aks-create/), [`apigee-hybrid-cluster-credentials`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cluster-credentials/), [`apigee-hybrid-kubectl-context-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-context-delete/) | Cluster lifecycle + kubeconfig |
| [**GCP Project / IAM**](#gcp-project-iam) | [`apigee-hybrid-project-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-create/), [`apigee-hybrid-project-remove`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-remove/), [`apigee-hybrid-project-services-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-services-enable/), [`apigee-hybrid-firewall-region-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-firewall-region-enable/), [`apigee-ip-address`](bap_coe/apigee_hybrid/roles/apigee-ip-address/) | Project, services, firewall, IP discovery |
| [**Anthos Service Mesh**](#anthos-service-mesh) | [`apigee-hybrid-asm-install`](bap_coe/apigee_hybrid/roles/apigee-hybrid-asm-install/) | Revision-tagged Istio + kpt |
| [**apigeectl Lifecycle**](#apigeectl-lifecycle) | [`apigee-hybrid-apigeectl-init`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-init/), [`apigee-hybrid-apigeectl-configure`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure/), [`apigee-hybrid-apigeectl-apply`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-apply/), [`apigee-hybrid-apigeectl-checkready`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-checkready/), [`apigee-hybrid-apigeectl-download`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-download/), [`apigee-hybrid-apigeectl-dir-structure`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-dir-structure/), [`apigee-hybrid-apigee-version`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigee-version/), [`apigee-hybrid-apigeectl-configure-multi-region-prep`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure-multi-region-prep/), [`apigee-hybrid-apigeectl-configure-multi-region-clear-settings`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure-multi-region-clear-settings/) | Runtime install/configure/apply + multi-region |
| [**Self-healing / Connect**](#self-healing-connect) | [`apigee-hybrid-apigeectl-apply`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-apply/), [`apigee-hybrid-apigee-connect-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigee-connect-enable/), [`apigee-hybrid-apigee-cluster-ready-check`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigee-cluster-ready-check/) | IAM self-healing on apply; Apigee Connect; readiness |
| [**Ingress / TLS**](#ingress-tls) | [`apigee-hybrid-ingressgateway-expose-endpoint`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-expose-endpoint/), [`apigee-hybrid-ingressgateway-healthcheck`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-healthcheck/), [`apigee-hybrid-ingressgateway-healthcheck-noDNS`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-healthcheck-noDNS/), [`apigee-hybrid-kubectl-ingressgateway`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-ingressgateway/), [`apigee-hybrid-kubectl-cert-manager-install`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-cert-manager-install/), [`apigee-hybrid-kubectl-cert-manager-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-cert-manager-delete/), [`apigee-hybrid-tls-certs-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-tls-certs-create/), [`apigee-hybrid-tls-certs-destroy`](bap_coe/apigee_hybrid/roles/apigee-hybrid-tls-certs-destroy/) | Ingress exposure, cert-manager, TLS certs |
| [**Control Plane**](#control-plane) | [`apigee-hybrid-org-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-org-create/), [`apigee-hybrid-env-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-env-create/), [`apigee-hybrid-group-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-group-create/), [`apigee-hybrid-group-attach`](bap_coe/apigee_hybrid/roles/apigee-hybrid-group-attach/), [`apigee-hybrid-uri-synchronizer-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-uri-synchronizer-enable/) | org/env/group provisioning |
| [**Operator Environment**](#operator-environment) | [`apigee-hybrid-setup-environment-gcp`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-gcp/), [`apigee-hybrid-setup-environment-kubernetes`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-kubernetes/), [`apigee-hybrid-setup-environment-az`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-az/), [`apigee-hybrid-setup-environment-docker`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-docker/) | Local control-host setup per cloud |
| [**DNS**](#dns) | [`apigee-hybrid-cloud-dns-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cloud-dns-create/), [`apigee-hybrid-cloud-dns-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cloud-dns-delete/) | Managed DNS for ingress |
| [**Test Harness**](#test-harness) | [`apigee-hybrid-molecule-hello-world`](bap_coe/apigee_hybrid/roles/apigee-hybrid-molecule-hello-world/) | Collection-quality test scaffolding |

---

## Capability map explained (business value by group)

Each group below explains what it does, why it matters in production, the roles involved, the expertise demonstrated, and how it evolved from the standalone OPDK/Hybrid repos.

<a name="k8s-provisioning"></a>
### K8s Provisioning

**What it does.** Creates, configures, and tears down the Kubernetes clusters that host Apigee Hybrid. Supports both GKE (`apigee-hybrid-gke-create`, `-delete`) and AKS (`apigee-hybrid-aks-create`), handles kubeconfig context management (`apigee-hybrid-cluster-credentials`, `apigee-hybrid-kubectl-context-delete`), and supports regional vs. zonal cluster shapes.

**Why it matters in production.** Apigee Hybrid is a stateful, multi-service platform running inside Kubernetes. The cluster needs correct node pools, network tags, and firewall rules; a kubeconfig lifecycle that does not leak stale contexts; and region-aware provisioning for incremental multi-region topologies. A misconfigured cluster blocks the rest of the installation.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-gke-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-gke-create/) | Provisions a regional or zonal GKE cluster with Apigee-Hybrid-compatible settings. |
| [`apigee-hybrid-gke-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-gke-delete/) | Tears down the GKE cluster and cleans up dependent context. |
| [`apigee-hybrid-aks-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-aks-create/) | Provisions an AKS cluster for Azure-based Apigee Hybrid deployments. |
| [`apigee-hybrid-cluster-credentials`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cluster-credentials/) | Generates and caches kubeconfig files for provisioned clusters. |
| [`apigee-hybrid-kubectl-context-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-context-delete/) | Removes stale kubectl contexts to avoid accidental operations against deleted clusters. |

**Expertise demonstrated.** Kubernetes platform engineering, multi-cloud shape discipline, and clean teardown that removes both the cluster and its local kubeconfig artifact.

**Evolution from OPDK / standalone repos.** OPDK ran on bare-metal or VM-based “planets.” The conceptual ancestor is the topology-planning work in the standalone installation playbooks: [`apigee-opdk-playbook-installation-single-region`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-single-region), [`two-regions`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-two-regions), and [`third-region`](https://github.com/carlosfrias/apigee-opdk-playbook-installation-third-region). The same topology thinking migrated from host inventories to Kubernetes cluster objects.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-gke-create/tasks/main.yml` and `regional.yml` / `zonal.yml`.

<a name="gcp-project-iam"></a>
### GCP Project / IAM

**What it does.** Prepares the Google Cloud project and identity layer: project creation/removal, API service enablement, IAM policy bindings, firewall rules, external IP discovery, and project metadata retrieval.

**Why it matters in production.** Apigee Hybrid requires many GCP services (Compute, Container, Cloud DNS, Service Networking, IAM, Apigee) to be enabled before cluster or runtime work can begin. IAM bindings must be correct for runtime service accounts. Firewall rules must be region-aware. This group is the foundation; everything above it assumes it is correct.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-project-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-create/) | Creates the host GCP project. |
| [`apigee-hybrid-project-remove`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-remove/) | Removes the host GCP project. |
| [`apigee-hybrid-project-services-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-project-services-enable/) | Enables the GCP APIs required by Apigee Hybrid. |
| [`apigee-hybrid-firewall-region-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-firewall-region-enable/) | Creates region-aware firewall rules for the runtime. |
| [`apigee-ip-address`](bap_coe/apigee_hybrid/roles/apigee-ip-address/) | Discovers or reserves external IP addresses for ingress. |

**Expertise demonstrated.** Cloud account and project governance, least-privilege IAM at scale, and region-aware network security.

**Evolution from OPDK / standalone repos.** OPDK also needed project-level GCP resources, but focused on VM provisioning. The discipline here evolved from the `bap_coe/gcp_management` collection and the standalone bootstrap repo [`apigee-opdk-playbook-setup-ansible`](https://github.com/carlosfrias/apigee-opdk-playbook-setup-ansible).

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-project-services-enable/`, then `apigee-hybrid-firewall-region-enable/`.

<a name="anthos-service-mesh"></a>
### Anthos Service Mesh

**What it does.** Installs Anthos Service Mesh (ASM), the revision-tagged Istio distribution that provides mTLS, traffic management, and ingress gateway services for Apigee Hybrid.

**Why it matters in production.** ASM is the data plane between Apigee Hybrid runtime components. It must be installed with a specific revision tag so upgrades can be rolled out incrementally. The installation depends on kpt packages and the correct Istio binary for the target platform.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-asm-install`](bap_coe/apigee_hybrid/roles/apigee-hybrid-asm-install/) | Downloads, installs, and configures ASM with revision-tagged Istio and kpt packages. |

**Expertise demonstrated.** Service-mesh lifecycle management, platform-specific artifact handling, and dependency ordering.

**Evolution from OPDK / standalone repos.** There is no OPDK equivalent to ASM. The closest conceptual ancestor is the OPDK edge-layer and SSL termination work: [`apigee-opdk-setup-mirror-nginx`](https://github.com/carlosfrias/apigee-opdk-setup-mirror-nginx) and [`apigee-opdk-setup-edge-sso-config`](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config). The migration is from reverse-proxy/Nginx SSL termination to Istio/ASM mesh security.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-asm-install/tasks/main.yml` and the included `install-istio-gke.yml` files.

<a name="apigeectl-lifecycle"></a>
### apigeectl Lifecycle

**What it does.** Manages the full lifecycle of the `apigeectl` CLI: init, configure, apply, checkready, download, directory structure, version checks, and multi-region configuration prep/clear.

**Why it matters in production.** `apigeectl` is the bridge between the Apigee management plane and the Kubernetes runtime. Its `overrides.yml` contains topology decisions — Cassandra replica count, resource requests, encryption keys, synchronizer/runtime/MART/UDCA sizing. The configure role generates `overrides.yml` from templates; the multi-region prep/clear roles manage incremental region additions.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-apigeectl-init`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-init/) | Initializes the apigeectl workspace. |
| [`apigee-hybrid-apigeectl-configure`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure/) | Generates `overrides.yml` from non-prod/prod templates. |
| [`apigee-hybrid-apigeectl-apply`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-apply/) | Applies the runtime; includes IAM self-healing (see Self-healing / connect). |
| [`apigee-hybrid-apigeectl-checkready`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-checkready/) | Verifies that the runtime is ready. |
| [`apigee-hybrid-apigeectl-download`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-download/) | Downloads the apigeectl binary. |
| [`apigee-hybrid-apigeectl-dir-structure`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-dir-structure/) | Prepares the apigeectl working directory. |
| `apigee-hybrid-apigeectl-version` | Verifies the apigeectl version. |
| [`apigee-hybrid-apigeectl-configure-multi-region-prep`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure-multi-region-prep/) | Prepares settings for an additional region. |
| [`apigee-hybrid-apigeectl-configure-multi-region-clear-settings`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure-multi-region-clear-settings/) | Clears region-specific settings before re-running configure. |

**Expertise demonstrated.** Configuration-as-code for runtime platforms, capacity and topology modeling, and progressive multi-region rollout.

**Evolution from OPDK / standalone repos.** The OPDK equivalent was silent-installation response files and component-by-component planet configuration: [`apigee-opdk-setup-silent-installation-config`](https://github.com/carlosfrias/apigee-opdk-setup-silent-installation-config), [`apigee-opdk-setup-component`](https://github.com/carlosfrias/apigee-opdk-setup-component), and the multi-region playbooks. The migration is from host-based silent installation to Kubernetes-native runtime configuration.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-configure/tasks/main.yml` to see override-file generation and production parameters. Then read the multi-region prep/clear roles.

<a name="self-healing-connect"></a>
### Self-healing / Connect

**What it does.** Reconciles the Apigee Hybrid runtime against live GKE clusters. The centerpiece is `apigee-hybrid-apigeectl-apply`, which invokes `apigeectl apply`, detects IAM permission failures from `stderr`, auto-grants the missing GCP service-account bindings (`roles/apigeeconnect.Agent` for `apigee-mart`, `roles/apigee.runtimeAgent` for `apigee-watcher`), and retries. Companion roles enable Apigee Connect and verify cluster readiness.

**Why it matters in production.** Apigee Hybrid assumes the control plane has the right IAM bindings. Those bindings are project-level (invisible inside `kubectl`), not always obvious from docs, and surface only at apply time. Before this automation, the failure path was: run apply → fail with a service-account error → open a runbook → grant the binding → re-run apply. This group encodes that recovery path so the apply itself fixes the binding and retries.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-apigeectl-apply`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-apply/) | Runs `apigeectl apply`, parses stderr for IAM errors, grants missing `apigeeconnect.Agent` / `apigee.runtimeAgent` roles, and retries. |
| [`apigee-hybrid-apigee-connect-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigee-connect-enable/) | Enables the Apigee Connect bridge between management plane and runtime cluster. |
| [`apigee-hybrid-apigee-cluster-ready-check`](bap_coe/apigee_hybrid/roles/apigee-hybrid-apigee-cluster-ready-check/) | Verifies that the runtime cluster is ready before downstream roles proceed. |

**Expertise demonstrated.** Failure-aware reconciliation, cross-layer debugging (GCP IAM for a Kubernetes-reported failure), idempotent remediation, and runtime-to-management trust-boundary understanding.

**Evolution from OPDK / standalone repos.** In the OPDK era, the equivalent problem was “management server cannot reach Cassandra” or “message processor cannot validate the license,” fixed by SSHing into nodes. That pattern is preserved but migrated from host-level remediation to API-level remediation. Predecessors: [`apigee-opdk-setup-validate`](https://github.com/carlosfrias/apigee-opdk-setup-validate), [`apigee-opdk-setup-status`](https://github.com/carlosfrias/apigee-opdk-setup-status), [`apigee-opdk-setup-default-settings`](https://github.com/carlosfrias/apigee-opdk-setup-default-settings). The core idea is the same: **model the platform, detect drift, remediate, retry.**

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-apigeectl-apply/tasks/main.yml`. The rescue block that checks `apply_status.stderr` and runs `gcloud projects add-iam-policy-binding` is the single best evidence of this group’s production value.

<a name="ingress-tls"></a>
### Ingress / TLS

**What it does.** Exposes the Apigee Hybrid runtime to external traffic, installs and manages cert-manager, and creates or destroys TLS certificates for ingress gateway endpoints.

**Why it matters in production.** API traffic cannot reach the Apigee runtime until the ingress gateway has an external IP, a DNS record, and a valid TLS certificate. cert-manager must be in place before certificates can be requested. The collection handles both provided certificates (customer CA) and self-signed certificates (lab/non-prod).

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-ingressgateway-expose-endpoint`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-expose-endpoint/) | Exposes the ingress gateway via a LoadBalancer service. |
| [`apigee-hybrid-ingressgateway-healthcheck`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-healthcheck/) | Performs a health check against the exposed endpoint. |
| [`apigee-hybrid-ingressgateway-healthcheck-noDNS`](bap_coe/apigee_hybrid/roles/apigee-hybrid-ingressgateway-healthcheck-noDNS/) | Health check that does not require DNS to be provisioned yet. |
| [`apigee-hybrid-kubectl-ingressgateway`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-ingressgateway/) | Helper tasks for ingress gateway kubectl operations. |
| [`apigee-hybrid-kubectl-cert-manager-install`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-cert-manager-install/) | Installs cert-manager in the cluster. |
| [`apigee-hybrid-kubectl-cert-manager-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-kubectl-cert-manager-delete/) | Removes cert-manager from the cluster. |
| [`apigee-hybrid-tls-certs-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-tls-certs-create/) | Creates TLS certificates (provided or self-signed). |
| [`apigee-hybrid-tls-certs-destroy`](bap_coe/apigee_hybrid/roles/apigee-hybrid-tls-certs-destroy/) | Destroys TLS certificates. |

**Expertise demonstrated.** End-to-end ingress lifecycle, certificate flexibility, PKI on Kubernetes, and operational verification (health checks with and without DNS).

**Evolution from OPDK / standalone repos.** OPDK handled ingress and TLS at the edge gateway / Nginx / load-balancer layer: [`apigee-opdk-setup-mirror-nginx`](https://github.com/carlosfrias/apigee-opdk-setup-mirror-nginx), [`apigee-opdk-setup-edge-sso-config`](https://github.com/carlosfrias/apigee-opdk-setup-edge-sso-config). The migration is from host-based reverse proxies to Kubernetes LoadBalancer + cert-manager + Istio ingress gateway.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-tls-certs-create/tasks/main.yml` to see the provided-vs-self-signed branch, then `apigee-hybrid-ingressgateway-expose-endpoint/`.

<a name="control-plane"></a>
### Control Plane

**What it does.** Provisions the Apigee organization, environments, and environment groups that make up the control plane, plus the URI synchronizer and Apigee Connect.

**Why it matters in production.** The control plane is the boundary between API management (policies, products, developers, apps) and the runtime (traffic processing). Creating these objects incorrectly or in the wrong order means APIs cannot be deployed or traffic cannot be routed. Org creation is asynchronous and can take minutes.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-org-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-org-create/) | Creates the Apigee organization via the management API. |
| [`apigee-hybrid-env-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-env-create/) | Creates an Apigee environment. |
| [`apigee-hybrid-group-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-group-create/) | Creates an environment group. |
| [`apigee-hybrid-group-attach`](bap_coe/apigee_hybrid/roles/apigee-hybrid-group-attach/) | Attaches an environment to a group. |
| [`apigee-hybrid-uri-synchronizer-enable`](bap_coe/apigee_hybrid/roles/apigee-hybrid-uri-synchronizer-enable/) | Enables URI synchronization between management plane and runtime. |

**Expertise demonstrated.** API management platform operations, idempotent provisioning (tolerates `409` already-exists), and ordering/dependency management.

**Evolution from OPDK / standalone repos.** The OPDK control plane was provisioned through the Apigee management server REST API and silent-installation configuration: [`apigee-opdk-setup-org`](https://github.com/carlosfrias/apigee-opdk-setup-org), [`apigee-opdk-setup-org-config`](https://github.com/carlosfrias/apigee-opdk-setup-org-config), [`apigee-opdk-setup-provisioning`](https://github.com/carlosfrias/apigee-opdk-setup-provisioning), [`apigee-opdk-setup-scopes-add`](https://github.com/carlosfrias/apigee-opdk-setup-scopes-add). The migration is from host-level provisioning to API-driven, asynchronous control-plane provisioning.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-org-create/tasks/main.yml` to see the long-running operation polling pattern.

<a name="operator-environment"></a>
### Operator Environment

**What it does.** Prepares the local control host (the machine from which Ansible is run) with the correct tools and credentials for GCP, Kubernetes, Azure, or Docker-based execution.

**Why it matters in production.** Apigee Hybrid deployments are controlled from a “jump” machine or CI/CD runner. That control host must have the right versions of `gcloud`, `kubectl`, `helm`, `apigeectl`, Docker, and cloud credentials. Inconsistent control hosts produce inconsistent playbook results.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-setup-environment-gcp`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-gcp/) | Installs/configures GCP CLI and credentials. |
| [`apigee-hybrid-setup-environment-kubernetes`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-kubernetes/) | Installs/configures Kubernetes CLI tools. |
| [`apigee-hybrid-setup-environment-az`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-az/) | Installs/configures Azure CLI tools. |
| [`apigee-hybrid-setup-environment-docker`](bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-docker/) | Installs/configures Docker for containerized execution. |

**Expertise demonstrated.** Reproducible control-plane tooling, multi-cloud CLI management, and credential hygiene.

**Evolution from OPDK / standalone repos.** OPDK also required a dedicated Ansible controller: [`apigee-opdk-setup-ansible-controller`](https://github.com/carlosfrias/apigee-opdk-setup-ansible-controller). The migration is from a Python/Ansible/Yum-based controller to a cloud-CLI + container-aware control host.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-setup-environment-gcp/` to see how credentials and CLI versions are managed.

<a name="dns"></a>
### DNS

**What it does.** Creates and deletes Cloud DNS managed zones and A-record transactions for Apigee Hybrid ingress endpoints.

**Why it matters in production.** Ingress endpoints must be reachable by a stable FQDN. Cloud DNS managed zones must exist before A records can be added, and DNS transactions must be handled atomically (start, add, execute) to avoid partial record states. The role also handles aborted or in-progress prior transactions.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-cloud-dns-create`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cloud-dns-create/) | Creates a Cloud DNS managed zone and adds A-record transaction. |
| [`apigee-hybrid-cloud-dns-delete`](bap_coe/apigee_hybrid/roles/apigee-hybrid-cloud-dns-delete/) | Deletes the managed zone and records. |

**Expertise demonstrated.** Atomic DNS transaction handling, idempotent zone creation, and ingress-DNS coupling.

**Evolution from OPDK / standalone repos.** OPDK deployments used internal DNS or `/etc/hosts` entries for host naming within a data center. Managed Cloud DNS for public ingress is specific to the Hybrid cloud-native model.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-cloud-dns-create/tasks/main.yml` to see the transaction and rescue block.

<a name="test-harness"></a>
### Test Harness

**What it does.** Provides Molecule-based test scaffolding for the collection, including a hello-world scenario and Molecule directories on several roles.

**Why it matters in production.** A 42-role collection without tests is unmaintainable. Molecule allows each role to be tested in isolation with converge/destroy/verify steps. The hello-world role gives a minimal working example for other roles to copy.

**Roles included**

| Role | Responsibility |
|------|----------------|
| [`apigee-hybrid-molecule-hello-world`](bap_coe/apigee_hybrid/roles/apigee-hybrid-molecule-hello-world/) | Minimal Molecule scenario used as a template for other roles. |
| Molecule directories on several roles | Converge/destroy/verify scenarios for setup-environment, apigee-version, ip-address, and others. |

**Expertise demonstrated.** Collection-quality discipline, test-driven role design, and maintainability at scale.

**Evolution from OPDK / standalone repos.** The standalone OPDK repos had no standardized test harness. Molecule was added as part of the migration to collection format — an evolution in engineering maturity, not just packaging.

**Evaluator entry point.** Start with `bap_coe/apigee_hybrid/roles/apigee-hybrid-molecule-hello-world/` and the `molecule/default/converge.yml` files under `setup-environment`, `apigee-version`, and `ip-address`.

---

## Usage

This toolkit is an Ansible collection. Install it (or build locally with the provided `bap-coe-collection-builder.yml` playbook) and provide credentials via the sensitive-attributes template.

1. Copy `apiee-hybrid-senitive-attributes-TEMPLATE.yml`, rename it, and place it in a location of your choosing.
2. Update the `vars_files:` stanza in the installation playbooks with the name and path of your file.
3. See `bap_coe/apigee_hybrid/README.md` and `bap_coe/apigee_hybrid/playbooks/` for installation playbooks.

### Requirements

Ansible 2.9 or 2.10 — see `requirements-ansible-2.9.txt` / `requirements-ansible-2.10.txt` / `requirements-no-versions.txt`.

---

## Provenance

Sole-authored and maintained by **Carlos Frias** during his tenure working with Apigee Hybrid, beginning approximately one year after Apigee Hybrid's general availability. The cloud-native evolution of [`apigee-edge-opdk`](https://github.com/carlosfrias/apigee-edge-opdk) — migrating the automation approach from an on-prem Private Cloud monorepo to a Kubernetes-native, collection-distributed toolkit. Active development spans 2020–2025.

Contributions welcome — see [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

See [LICENSE](./LICENSE).