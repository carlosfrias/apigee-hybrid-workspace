Apigee Hybrid Project Create
=========

This project will create a GCP project with the provided name and assigned to 
the provided Billing Id. 

Requirements
------------

This role uses `gcloud` for it's operations. `gcloud` can be installed individually. 
`gcloud` is also installed if you invoke the [Apigee Hybrid Setup Environment Kubernetes](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/apigee-hybrid-gke/roles/apigee-hybrid-setup-environment-kubernetes/README.md)
role. 

Role Variables
--------------

The variables that can be passed into this role are listed in the table below:

| Variable Name | Purpose |
|---------------|---------|
| PROJECT_ID | Name of the project |
| GCLOUD_ACCOUNT_EMAIL | Account email of the project owner |
| BILLING_ID | Billing ID account that should be linked to the project after it is created. |
| FOLDER_ID | This is the GCP folder in which you will create your project. It is assumed you have permissions to create projects in this folder. |

Dependencies
------------

- [Apigee Hybrid Setup Environment Kubernetes](https://github.com/carlosfrias/apigee-hybrid-workspace/blob/master/apigee-hybrid-gke/roles/apigee-hybrid-setup-environment-kubernetes/README.md)

