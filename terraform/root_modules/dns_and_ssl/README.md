# dns_and_ssl
This root module creates the hosted manage zone for dev-public.databytesprojectecho.com and a wildcard certificate which is intended to be used by the external facing load balancer for the service_cluster root module.

## Resources deployed
* DNS managed zone for dev-public.databytesprojectecho.com
* Wildcard ssl cert for dev-public.databytesprojectecho.com
* Certificate map and entry for the wildcard cert.
* DNS authorisation for dev-public.databytesprojectecho.com wildcard certificate

## Deployment steps

<b>Steps summarised</b>
* Change directory to this root module
* Run terraform init to initalise terraform for the directory
* Run a terraform plan with common and environment specific tfvars files and review the resources being deployed
* Run a terraform apply with same tfvars files as plan to deploy the resources
* Run a terraform apply with -destroy flag and same tfvars files as before to destroy the resources

Run the following commands one at a time.

```bash
cd terraform/root_modules/dns_and_ssl
terraform init
terraform plan -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
terraform apply -destroy -var-file="../../vars/common.tfvars" -var-file="../../vars/dev.tfvars"
```

* Enter yes when prompted to by the terraform apply steps
* Replace dev in the second var file with sit or prod if deploying to the GCP project for other environments.
