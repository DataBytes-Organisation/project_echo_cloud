# root_modules
This directory contains Terraform root modules.

## Modules List

|Root module|Description|
|---|---|
|terraform_state_bucket|Root module that deploys the terraform state bucket for a project. It must be deployed once per GCP project and be set as the state backend for all other root modules.|
|service_cluster|Root module to deploy the Google Kubernetes Engine cluster for running Project Echo services. May include other resources relating to running services|

## Important note
Ensure the terraform_state_bucket is deployed exactly once per GCP project and that it is set as the state backend for all other root modules.
