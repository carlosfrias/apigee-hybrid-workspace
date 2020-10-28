# Apigee hybrid Accelerator Toolkit

The goal of this project is to create a toolkit for working with Apigee hybrid.
The anticipated audience for this toolkit are Apigee specialists that need to 
install, configure and deploy Apigee hybrid. Apigee hybrid can be deployed on 
GKE, Anthos on prem, Azure and AWS. This project will be used as a workspace that
will grow as we continue to work with our customers. 

## Toolkit Usage
This toolkit has been written using Ansible. Please install Ansible 2.9 or greater. 
Use the Cloud Shell to clone this project and change into the folder:

    sudo apt install ansible -y
    ansible-playbook apigee-hybrid-installation.yml 
    
### Sensitive Attributes Required
This apigee-hybrid-project-create role will attempt to create a GCP project. 
This is not required and you can avoid having the default installation with 

    ansible-playbook apigee-hybrid-installation.yml --skip-tags project
   
If you decide to use this project to create a GCP project then please use the 
provided `apigee-hybrid-sensitive-attributes-TEMPLATE.yml` file to provide 
required attributes. 
    
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

