# Apigee hybrid Instance Manager Using Helm 

This is an Ansible collection installs an instance of Apigee hybrid using helm. 
Customizable defaults are used to quickly create a GCP project, GKE cluster and 
a deployment of Apigee hybrid. 

# Configuration of Apigee hybrid Instance Manager

Configuration is performed in a series of `.yml` files that are scoped to the
different areas that need to be configured. Security credentials are
managed in a secure folder in the user home folder. Apigee hyrid configuration
 attributes are managed in the setup directory.

## Security Credentials

Security credentials are provided by a template file that must be populated. 




## Docker Invocation


       gcloud auth login
       docker run \
       -v ~/.apigee-secure:/root/.apigee-secure \
       -v $(pwd)/work_dir:/bootstrap-runtime/work_dir:rw \
       -v $(pwd)/resources:/bootstrap-runtime/resources:rw \
       -ti bootstrap-project bash

