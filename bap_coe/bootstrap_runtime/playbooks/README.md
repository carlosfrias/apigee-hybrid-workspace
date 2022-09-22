
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

# Configurations and File System Setup
1. Clone this git repository to an accessible workspace folder.
2. Change into your repository workspace folder.
3. Create a folder to stage project outputs:

        mkdir ./work_dir

4. Create a folder for project credentials: 

        mkdir $HOME/.apigee-secure

5. Use the following command with the template `resources/project-credentials.yml.template` to create your 
   credentials file: 

        cp resources/project-credentials.yml.template $HOME/.apigee-secure/argolis-credentials.yml

6. Update your credentials file with your GCP Organization ID, GCP Billing ID, project domain and admin user name.
7. It is required that you `resources/override.yml` with your project name. 
   Please note that the `FOLDER_DISPLAY_NAME` enables you to use a GCP folder under which to place your project. 
8. Please review the default attributes provided: `resources/defaults.yml` 
9. You can override `resources/defaults.yml` using `resources/overrides.yml` to indicate suitable org policies, service apis and service account permissions would be applied to the project.

# Docker Build
1. Change into the directory containing the Dockerfile or pass in the path to the Dockerfile.
2. Build the container: `docker build -t bootstrap-project .`
3. Run the container: `docker run -v ~/.apigee-secure:/root/.apigee-secure -v $(pwd)/work_dir:/bootstrap-runtime/work_dir:rw -ti bootstrap-project bash`
4. Use override.yml to indicate the desired project id.
5. Copy resources/argolis-credentials.yml.template to ~/.apigee-secure/argolis-template.yml
6. Update argolis-template.yml with your credentials, GCP billing id and GCP org id
7. Enable pyenv activate apigee
8. molecule converge -s config-build
9. molecule converge 