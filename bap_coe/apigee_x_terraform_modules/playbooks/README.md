# Usage Instructions

1. Update access credentials

    vim ~/.apigee-secure/argolis-credentials.yml

2. Update build with the name of the project 

    vim ./override.yml

3. Update the TERRAFORM_PROJECT_NAME to use

    vim ./override.yml

4. Update the configuration of the build

    molecule converge -s config-build

5. Deploy apigee x instance

    molecule converge

