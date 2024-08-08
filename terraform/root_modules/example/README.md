# example
This root module is an example root module for creating further root modules.

## Resources deployed
It deploys a GCP Virtual Private Network and a Compute Engine Virtual Machine.

## Deployment steps

<b>Steps summarised</b>
* Change directory to this root module
* Run terraform init to initalise terraform for the directory
* Run a terraform plan with common and environment specific tfvars files and review the resources being deployed
* Run a terraform apply with same tfvars files as plan to deploy the resources
* Run a terraform apply with -destroy flag and same tfvars files as before to destroy the resources

Run the following commands one at a time.

```bash
cd terraform/root_modules/example
terraform init
terraform plan -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -destroy -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
```

* Enter yes when prompted to by the terraform apply steps
* Replace dev in the second var file with sit or prod if deploying to the GCP project for other environments.