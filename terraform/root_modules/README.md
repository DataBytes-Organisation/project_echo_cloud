# root_modules
This directory contains Terraform root modules.

## Modules List

|Root module|Description|
|---|---|
|example|This is an example root module and provides guidance on how to create a new root module|
|terraform_state_bucket|Root module that deploys the terraform state bucket for a project. It <b>must be deployed once per GCP project and be set as the state backend for all other root modules. Be careful with this module and do not destroy it unless you're very certain of what you're doing.</b>|
|service_cluster|Root module to deploy the Google Kubernetes Engine cluster for running Project Echo services. May include other resources relating to running services|

## Important note
Ensure the terraform_state_bucket is deployed exactly once per GCP project and that it is set as the state backend for all other root modules. The prefix for each backend within the backend configuration must be unique to the root module. Beware it cannot be variable driven so must be hard coded.

## New root module creation
See the example root module for an example of how to create a new root module. Create a README.md file within its directory and add it to the table above in this file.

## Deployment steps
To deploy a root module general steps are provided below.

<b>Steps summarised</b>
* Change directory to the root module being deployed
* Run terraform init to initalise terraform for the directory
* Run a terraform plan with common and environment specific tfvars files and review the resources being deployed
* Run a terraform apply with same tfvars files as plan to deploy the resources

Run the following commands one at a time.

```bash
cd terraform/root_modules/MODULE_NAME
terraform init
terraform plan -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
```

* Enter yes when prompted to by the terraform apply step
* Replace dev in the second var file with sit or prod if deploying to the GCP project for other environments.
* When required to destroy the deployed resources run apply with the -destroy command.
