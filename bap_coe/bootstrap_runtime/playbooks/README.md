
# Usage of bootstrap-project
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