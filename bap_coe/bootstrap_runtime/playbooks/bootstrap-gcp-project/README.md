# Bootstrap Project Manager
This Dockerfile will allow you to provision and de-provision a GCP project. You
would provide the project name and credentials and execute the build. The steps
provided below would allow you to capture the downloaded service account credential 
files and any org policies that have been applied. This project manager uses 
the `gcloud` cli. This has been implemented with Ansible and wrapped with the molecule framework. 

# Table of Contents
1. [Bootstrap Project Manager Features](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#bootstrap-project-manager-features)
2. [Bootstrap Project Manager Overview](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#bootstrap-project-manager-overview)
3. [Build Scenarios Description](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#build-scenarios-descriptions)
4. [Getting Started](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#getting-started)
5. [Configurations and File System Setup](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#configurations-and-file-system-setup)
6. [Docker Usage](https://github.com/carlosfrias/apigee-hybrid-workspace/tree/master/bap_coe/bootstrap_runtime/playbooks/bootstrap-gcp-project#docker-usage)

# Bootstrap Project Manager Features
The features of this bootstrap project manager will allow you to add or remove the following: 
1. Create or destroy a project with the name provided, if it is available for your use.
2. Apply organization policies or disable organization constraints. 
3. Enable Service APIs.
4. Create service account 
5. Download service account keys
6. Set service account permissions

The architecture used you gain the ability to selectively invoke portions 
of strictly bootstrapping a project in one invocation. The architecture used also 
provides the ability to discreetly add, create and configure each step independently 
of the others and thus enable you to manage the 6 different steps of project creation.  

# Bootstrap Project Manager Overview
The Bootstrap Project Manager has categorized the creation of a GCP project into 6 steps. 
These steps have been defined using molecule scenarios. The default molecule scenario executes 
each of the six steps in sequence. It should be noted that each scenario can be invoked
individually. So whether you invoke the default scenario or invoke each scenario individually 
you will always be executing the same scripts for the corresponding step. 

This is a project manager because it enables you to not only apply settings to a project but you can also 
unapply those settings. This enables you to work to be very selective about the application of org policies
and permissions in a project. 

## Build Scenarios Descriptions
A default scenario has been defined as a master scenario that invokes each of the scenario steps until a GCP project is built. 
The default scenario is invoked as follows: 

       molecule converge

The 6 scenario have been defined as:

| Invocation Sequence | Scenario name                | Scenario Invocation                                | Scenario Description                                                                   |
|---------------------|------------------------------|----------------------------------------------------|----------------------------------------------------------------------------------------|
| 1.                  | provision-project            | `molecule converge -s provision-project`           | Create or destroy a project with the name provided, if it is available for your use.   |
| 2.                  | config-org-policies          | `molecule converge -s config-org-policies`         | Apply organization policies or disable organization constraints  |                         
| 3.                  | config-services              | `molecule converge -s config-services`             | Enable Service APIs.
| 4.                  | config-svc-accts-create      | `molecule converge -s config-svc-accts-create`     | Create service account                                                   |
| 5.                  | config-svc-accts-keys        | `molecule converge -s config-svc-accts-keys`       | Download service account keys                                        |
| 6.                  | config-svc-accts-permissions | `molecule converge -s config-svc-accts-permissions` | Set service account permissions                                   |

### Invocations using Debug Mode
All molecule scenarios can be invoked in debug mode with increased log verbosity. 
Each molecule scenarios can be invoked in debug mode at the command line by adding the 
flags `--debug -vvv` to the molecule command in the following way: 

       molecule --debug -vvv converge

This can be applied to scenario invocations in the following way: 

       molecule --debug -vvv converge -s provision-project

## Getting Started
The following instructions are to get started and quickly bring up a functional project
1. Configuration and File System Setup
2. Docker Build and Run

# Configurations and File System Setup
1. Clone this git repository to an accessible workspace folder.

      git clone https://github.com/carlosfrias/apigee-hybrid-workspace.git

2. Change into your repository workspace folder.

        cd [YOUR_REPOSITORY_WORKSPACE_FOLDER]/apigee-hybrid-workspace/bap_coe_bootstrap_runtime/playbooks/bootstrap-gcp-project

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

7. It is required that you `resources/override.yml` with your project name. Attributes defined in `resources/override.yml'
   Please note that the `FOLDER_DISPLAY_NAME` enables you to use a GCP folder under which to contain your project. 

       ---
       PROJECT_ID: "friasc-runtime-MMDDYYYY_HHMM"
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

4. The container terminal should be in the correct location and you can then enable the virtualenv manager as follows: 

       pyenv activate apigee

5. You can then execute a full build: 

       molecule converge 

6. You can examine and collect the output of the invocation within the container at the location: `/bootstrap-runtime/work_dir`.
   You can also examine and collect the output outside the container at your workspace folder: `[WORKSPACE_FOLDER]/work_dir`. 

7. Invoking the container with the same parameters as above will allow you to continue from where you left off in the prior session.
