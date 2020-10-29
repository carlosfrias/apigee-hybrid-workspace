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

## Toolkit Capabilities
This toolkit has the following capabilities:
| Playbook | Capability |
| -------- | ---------- |
| apigee-hybrid-installation.yml | Create a GCP project; configures and installs Apigee hybrid using either small, medium or large overrides.yml templates |
| apigee-hybrid-multi-region.yml | Installs an arbitrary number of additional regions to an existing Apigee hybrid region |

## Toolkit Usage
This toolkit has been written using Ansible. Please use Ansible 2.9 or greater. 
Use a terminal and git to clone this project to run the installation playbooks.

| Installation Playbook | Description |
| --------- | ---------- |  
| apigee-hybrid-installation.yml | Installs Apigee hybrid in a GKE region |
| apigee-hybrid-multi-region-installation.yml | Installs Apigee hybrid in additional regions as needed.  |

## Attributes to Update
This is a partial list of the attributes that should be reviewed and updated. 
These attribute names should be self documenting and can be found in the `vars:` 
stanza of the installation playbooks. This list is changing as the workspace grows 
so please see the playbooks for a current list. A representative example can be 
found in the following table.

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

## Playbooks and Playbook Tag Overview
The installation playbooks isolate the configuration and installation steps 
called out in the Apigee hybrid documentation using Ansible tags. This allows 
you to proceed through the installation of Apigee hybrid with one invocation 
that executes every step to a basic installation or in a step-wise manner. Tags 
invoke specific modules that have been associated with a tag. Tags can be 
invoked individually or as a comma delimited string containing a subset of the 
installation and configuration steps. 

### Invoking Playbooks
The installation playbook requires the sudo password. Use `-K` to provide the sudo
password in a safe manner to the playbook. A complete installation is performed 
as follows: 

    cd apigee-hybrid-gke
    ansible-playbook apigee-hybrid-installation.yml -K

### Playbook verbosity
Playbook verbosity is controlled with the use of the `-v` flag. The use of three 
`-vvv`s is recommended:

    cd apigee-hybrid-gke
    ansible-playbook apigee-hybrid-installation.yml -vvv -K
    
### Playbook Step-Wise Execution
Playbook step-wise execution is enabled with the use of the `--step` flag.

    cd apigee-hybrid-gke
    ansible-playbook apigee-hybrid-installation.yml -vvv -K --step     

### Playbook Execution with Tags
Playbook execution can be limited to a set of tags using the `-t` flag. You can 
also skip tags using the `--skip-tags` flag. 

#### Sample Playbook Execution to Create GCP Project
This is a tag usage example that configures kubernetes and gcp tools, creates a
gcp project and enables the services required by Apigee hybrid.

    cd apigee-hybrid-gke
    ansible-playbook apigee-hybrid-installation.yml -vvv -K -t setup-env,project,services

#### Sample Playbook Execution to complete remainder of installation
This is a skip tag usage example that skips the work completed in the prior 
example to install Apigee hybrid.

    cd apigee-hybrid-gke
    ansible-playbook apigee-hybrid-installation.yml -vvv -K --skip-tags setup-env,project,services

### Playbook Tag Inventory
This is the tag inventory for apigee-hybrid-installation.yml

| Role Name | Tags |
|---------- | ---- |
| apigee-hybrid-setup-environment-kubernetes | setup-env |
| apigee-hybrid-setup-environment-gcp | setup-env,gcp | 
| apigee-hybrid-project-create | project |
| apigee-hybrid-project-services-enable | services |
| apigee-hybrid-org-create | org |
| apigee-hybrid-cloud-dns-create | dns |
| apigee-hybrid-cloud-env-create | env |
| apigee-hybrid-group-create | create-group,group |
| apigee-hybrid-group-attach | attach-group,group |
| apigee-hybrid-gke-create | gke |
| apigee-hybrid-apigeectl-download | download |
| apigee-hybrid-apigeectl-dir-structure | dir |
| apigee-hybrid-apigeectl-service-account-create | svc-acct |
| apigee-hybrid-synchronizer-enable | synchronizer |
| apigee-hybrid-apigee-connect-enable | connect |
| apigee-hybrid-tls-certs | tls |
| apigee-hybrid-cert-manager-install | cert-mgr |
| apigee-hybrid-asm-install | asm |
| apigee-hybrid-apigeectl-configure-multi-region-clear-settings | clear-multi |
| apigee-hybrid-apigeectl-configure | configure |
| apigee-hybrid-apigeectl-apply | apply |

## Workspace Outline
### Apigee hybrid GKE   
The folder `apigee-hybrid-gke` contains the scripts needed to an installation of 
Apigee hybrid 1.3 on GKE. This has not been tested with any other version of 
Apigee hybrid. Ansible has been configured to operate from this folder using the 
provided `ansible.cfg`.


