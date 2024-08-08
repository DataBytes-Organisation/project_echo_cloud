# terraform_state_bucket
This root module is the very first that should be ran to deploy the state bucket that will be used as the state backend for all other root modules. This enables Terraform state to be shared and consistently used among all cloud engineers working on Project Echo.

## Resources deployed
This root module deploys a GCP Storage bucket with public access blocked, uniform access controls with the default ACL settings, which grants editors and owners owner access on the bucket and other users of the project read only.

## Deployment steps
It is assumed that the engineer running these steps has Terraform configured locally and at least has editor permission to the GCP project that this bucket is being deployed to.

## Steps summarised
* Change directory to this root module
* Run terraform init to initalise terraform for the directory
* Run a terraform plan with common and environment specific tfvars files and review the resources being deployed
* Run a terraform apply with same tfvars files as plan to deploy the resources

Run the following commands one at a time.

```bash
cd terraform/root_modules/terraform_state_bucket
terraform init
terraform plan -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
```

* Enter yes when prompted to by the terraform apply step
* Replace dev in the second var file with sit or prod if deploying to the GCP project for other environments.

Finally, to verify deployment log into the GCP console and verify the bucket is deployed.
