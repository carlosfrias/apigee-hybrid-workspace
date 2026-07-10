# apigee-hybrid-workspace — Apigee Hybrid on Kubernetes Automation Toolkit

> **An Ansible collection (`bap_coe.apigee_hybrid`) that automates the full lifecycle of Apigee Hybrid on Kubernetes** — provision the cluster, install the runtime, configure multi-region, manage TLS and ingress, provision orgs/envs, and converge it all idempotently across GKE and AKS.

> [!NOTE]
> **Start here for the portfolio story** — this repo is the hub for the Apigee Hybrid / Kubernetes automation corpus and routes to the rest of the expertise. See the [skills assessment →](SKILLS-ASSESSMENT.md) for the expertise applied, or browse the related repos below.

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

| Group | Roles | Purpose |
|-------|-------|---------|
| **K8s provisioning** | `apigee-hybrid-{gke,aks}-{create,delete}`, `apigee-hybrid-cluster-credentials`, `apigee-hybrid-kubectl-context-delete` | Cluster lifecycle + kubeconfig |
| **GCP project / IAM** | `apigee-hybrid-{project-create,project-remove,project-services-enable}`, `apigee-hybrid-firewall-region-enable`, `apigee-ip-address` | Project, services, firewall, IP discovery |
| **Anthos Service Mesh** | `apigee-hybrid-asm-install` | Revision-tagged Istio + kpt |
| **apigeectl lifecycle** | `apigee-hybrid-apigeectl-{init,configure,apply,checkready,configure-multi-region-prep,configure-multi-region-clear-settings,download,dir-structure,version}` | Runtime install/configure/apply + multi-region |
| **Self-healing / connect** | `apigee-hybrid-apigeectl-apply`, `apigee-hybrid-apigee-connect-enable`, `apigee-hybrid-apigee-cluster-ready-check` | IAM self-healing on apply; Apigee Connect; readiness |
| **Ingress / TLS** | `apigee-hybrid-ingressgateway-{expose-endpoint,healthcheck,healthcheck-noDNS}`, `apigee-hybrid-kubectl-{ingressgateway,cert-manager-install,cert-manager-delete}`, `apigee-hybrid-tls-certs-{create,destroy}` | Ingress exposure, cert-manager, TLS certs |
| **Control plane** | `apigee-hybrid-{org,env,group}-{create,attach}`, `apigee-hybrid-uri-synchronizer-enable` | org/env/group provisioning |
| **Operator environment** | `apigee-hybrid-setup-environment-{gcp,kubernetes,az,docker}` | Local control-host setup per cloud |
| **DNS** | `apigee-hybrid-cloud-dns-{create,delete}` | Managed DNS for ingress |
| **Test harness** | `apigee-hybrid-molecule-hello-world` + Molecule dirs on several roles | Collection-quality test scaffolding |

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