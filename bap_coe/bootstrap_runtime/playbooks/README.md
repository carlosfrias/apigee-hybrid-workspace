
# Bootstrap Project Manager
This Dockerfile will allow you to provision and de-provision a GCP project. You
would provide the project name and credentials and execute the build. The steps
provided below would allow you to capture the downloaded service account credential 
files and any org policies that have been applied. Everything uses the `gcloud` cli.

This bootstrap manager will allow you to set the following: 
- Organization policies to apply
- Organization constraints to disable
- Service APIs to enable.
- Service account to create
- Service account keys to be downloaded
- Service account permissions to be set
- Create a project with the name provided, if it is available for your use.

1. Change into the directory containing the Dockerfile or pass in the path to the Dockerfile.
2. Build the container: `docker build -t bootstrap-project .`
3. Create a folder to stage project outputs: `mkdir work_dir`
4. Create a folder for project credentials: `mkdir ~/.apigee-secure`
5. Run the container: `docker run -v ~/.apigee-secure:/root/.apigee-secure -v $(pwd)/work_dir:/bootstrap-runtime/work_dir:rw -ti bootstrap-project bash`
6. Use override.yml to indicate the desired project id.
7. Copy resources/argolis-credentials.yml.template to ~/.apigee-secure/argolis-template.yml
8. Update argolis-template.yml with your credentials, GCP billing id and GCP org id
9. Enable pyenv activate apigee
10. molecule converge -s config-build
11. molecule converge 