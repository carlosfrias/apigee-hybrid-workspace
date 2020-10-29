# Apigee hybrid workspace toolkit

The goal of this project is to house the toolkit that has been constructed while 
conducting work sessions with Apigee hybrid. This repository houses an asset that 
is provided as a community contribution to help those charged with understanding, 
installing, configuring and maintaining Apigee hybrid. The audience for this 
toolkit also includes those that would like to understand how to model an 
automation effort for Apigee hybrid or begin working with Apigee hybrid. This 
repository is provided as is with no warranty of any kind. This is not a Google 
product. This is not supported by Apigee in any way. Any and all inquiries for 
information will be answered on a best effort basis as my schedule permits.

It is expected that you provide credentials and other sensitive attributes using
the provided template file `apiee-hybrid-senitive-attriubtes-TEMPLATE.yml`. 
Please rename this file and place it in a location of your choosing. Once this 
has been complete please update the `vars_files:` stanza in the installation playbooks
with the name and path of your file. 

## Toolkit Usage
This toolkit has been written using Ansible. Please use Ansible 2.9 or greater. 
Use a terminal and git to clone this project to run the installation playbooks.

| Playbook | Description |
| --------- | ---------- |  
| apigee-hybrid-installation.yml | Installs Apigee hybrid in a GKE region |
| apigee-hybrid-multi-region-installation.yml | Installs Apigee hybrid in additional regions as needed.  |

## Attributes to Validate

| Attribute Name | Description |
| -------------- | ----------- |
| PROJECT_ID |  "friasc-hybrid-10282020-1349" |
| REGION | "us-east1" |
| ENV_NAME | "test" |
| APIGEE_RUNTIME_SIZE | "medium" |
| CLUSTER_NAME | "apigee-hybrid-1" |
| CLUSTER_ZONE | "{{ REGION }}-b" |
| NODE_SIZE | "e2-standard-8" |
| NODE_COUNT | 8 |
| CASSANDRA_DATA_CENTER_NAME | "dc-1" |
| CASSANDRA_RACK_NAME | "ra-1" |
| PROVIDED_PUBLIC_CERT | "{{ ~ &#124; expanduser }}/.ssh/signed-certs/hybrid-apigee.net/demo-cert.pem" |
| PROVIDED_PRIVATE_KEY | "{{ ~  &#124; expanduser }}/.ssh/signed-certs/hybrid-apigee.net/demo-cert.key" |
| ISTIO_VERSION | "1.6.11" |
| ISTIO_VERSION_EXT | "asm.1" |
| ASM_KPT_VERSION | "1.6-asm" |




## Roles Inventory
The following tables is a list of the roles provided:

| Role | Used by Playbook |
| ---- | ----------- |
| apigee-hybrid-setup-environment-kubernetes | apigee-hybrid-installation.yml |
| apigee-hybrid-setup-environment-gcp | apigee-hybrid-installation.yml |
| apigee-hybrid-project-create | apigee-hybrid-installation.yml |
| apigee-hybrid-project-services-enable | apigee-hybrid-installation.yml |
| apigee-hybrid-org-create | apigee-hybrid-installation.yml |
| apigee-hybrid-cloud-dns-create | apigee-hybrid-installation.yml |
| apigee-hybrid-env-create | apigee-hybrid-installation.yml |
| apigee-hybrid-group-create | apigee-hybrid-installation.yml |
| apigee-hybrid-group-attach | apigee-hybrid-installation.yml |
| apigee-hybrid-gke-create | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-download | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-dir-structure | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-service-account-create | apigee-hybrid-installation.yml |
| apigee-hybrid-synchronizer-enable | apigee-hybrid-installation.yml |
| apigee-hybrid-apigee-connect-enable | apigee-hybrid-installation.yml |
| apigee-hybrid-tls-certs | apigee-hybrid-installation.yml |
| apigee-hybrid-cert-manager-install | apigee-hybrid-installation.yml |
| apigee-hybrid-asm-install | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-configure-multi-region-clear-settings | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-configure | apigee-hybrid-installation.yml |
| apigee-hybrid-apigeectl-apply | apigee-hybrid-installation.yml |

### Toolkit Targets
The toolkit has modules defined that allow you to work with a part of the 
installation and configuration of Apigee hybrid in isolation. You can invoke 
specific modules with their associated tag. Tags can be invoked individually or 
as a comma delimited string. 

#### Using a single tag
The following sample will create a project and stop execution. 

    ansible-playbook apigee-hybrid-installation.yml -t services

#### Using multiple tags to assert a known state
The following sample will install the tools we use for managing kubernetes, 
create the GCP project and register the organization with the Managment UI and stops
just before creating the DNS for the environment.

    ansible-playbook apigee-hybrid-installation.yml -t tools,project,org

The available tags are listed as 
follows:

| Role Name | Tags |
|--- | --- |
| apigee-hybrid-tools | tools |
| apigee-hybrid-project-create | project |
| apigee-hybrid-org-create | org |
| apigee-hybrid-cloud-dns-create | dns |
| apigee-hybrid-cloud-env-create | env |
| apigee-hybrid-group-create | create-group, group |
| apigee-hybrid-group-attach | attach-group, group |
| apigee-hybrid-gke-create | gke |
| apigee-hybrid-asm-install | asm |
| apigee-hybrid-apigeectl-download | download |
| apigee-hybrid-apigeectl-dir-structure | dir |
| apigee-hybrid-apigeectl-service-account-create | svc-acct |
| apigee-hybrid-tls-certs | tls |
| apigee-hybrid-apigeectl-configure | configure |
| apigee-hybrid-apigeectl-apply | apply |
| apigee-hybrid-synchronizer-enable | synchronizer |
| apigee-hybrid-apigee-connect-enable | connect |

## Workspace Outline
### Apigee hybrid GKE   
The folder apigee-hybrid-gke contains the scripts needed to an installation of 
Apigee hybrid 1.3 on GKE. This has not been tested with any other version of 
Apigee hybrid.

