
# Bootstrap Project Manager
This Dockerfile will allow you to provision and de-provision a GCP project. You
would provide the project name and credentials and execute the build. The steps
provided below would allow you to capture the downloaded service account credential 
files and any org policies that have been applied. This project manager uses 
the `gcloud` cli.

# Bootstrap Project Manager Features
The features of this bootstrap project manager will allow you to set the following: 
- Organization policies to apply
- Organization constraints to disable
- Service APIs to enable.
- Service account to create
- Service account keys to be downloaded
- Service account permissions to be set
- Create a project with the name provided, if it is available for your use.
- Selectively invoke portions of the bootstrap instead of creating the project in one invocation.
- De-provision the entire project or selectively de-provision steps. 

# Configurations and File System Setup
1. Clone this git repository to an accessible workspace folder.
2. Change into your repository workspace folder.
3. Create a folder to stage project outputs:

       mkdir ./work_dir

4. Create a folder for project credentials: 

       mkdir $HOME/.apigee-secure

5. Use the following command with the template `resources/credentials.yml.template` to create your 
   credentials file as in the following example: 

       cp resources/project-credentials.yml.template $HOME/.apigee-secure/argolis-credentials.yml

6. Update your credentials file with your GCP Organization ID, GCP Billing ID, project domain and admin user name.

       ---
       GCLOUD_ORG_ID: "CHANGE_ME"
       GCLOUD_ACCOUNT_DOMAIN: "CHANGE_ME"
       BILLING_ID: "CHANGE_ME"
       GCLOUD_ACCOUNT_USER: "CHANGE_ME"

7. It is required that you `resources/override.yml` with your project name. 
   Please note that the `FOLDER_DISPLAY_NAME` enables you to use a GCP folder under which to contain your project. 

       ---
       PROJECT_ID: "friasc-runtime-[mmddyyy]-[hhmm]"
       CREDENTIALS_FILE_PATH: "{{ '~' | expanduser }}/.apigee-secure/CREDENTIALS_FILE_NAME.yml"
       #FOLDER_DISPLAY_NAME: abm


8. Please review the default attributes provided `resources/defaults.yml` to validate that they work for your project. 
9. You can override `resources/defaults.yml` using `resources/overrides.yml` to indicate suitable org policies, service apis and service account permissions would be applied to the project.

# Docker Usage
1. Change into the directory containing the Dockerfile or pass in the path to the Dockerfile.
2. Build the container:

       docker build -t bootstrap-project .

3. Run the container: 

       docker run \
       -v ~/.apigee-secure:/root/.apigee-secure \
       -v $(pwd)/work_dir:/bootstrap-runtime/work_dir:rw \
       -v $(pwd)/resources:/bootstrap-runtime/resources:rw \
       -ti bootstrap-project bash

5. The container terminal should be in the correct location and you can then enable the virtualenv manager as follows: 

       pyenv activate apigee

6. You can then execute a full build: 

       molecule converge 

