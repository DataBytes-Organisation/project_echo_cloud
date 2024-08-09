# project_echo_cloud
Repo containing code relating to Project Echo GCP deployments. Mostly terraform and kubernetes.

## Getting Started

To begin working with this repository ensure you have at least a basic understanding of Terraform, Docker, Kubernetes and Google Cloud Platform (GCP).

A copy of setting up Terraform for GCP deployments has been placed under /documentation/GettingStarted to assist with setting up Terraform on a cloud engineer's local PC.

## Project initialisation

To begin working collaboratively within a GCP project for Project Echo the Terraform state bucket must first be deployed. It is located in the /terraform/root_modules/terraform_state_bucket directory. See the readme file there for directions on deploying the state bucket.

### Contribution Guidelines

To contribute create a new branch off of <b>main</b>, make your changes within your branch, test the changes and collect evidence of the testing. Then raise a pull request to <b>main</b> and fill in the pull request template. Your code will require review and approval before it can be merged.

Squash commits before or on merge to <b>main</b>. There is a dropdown next to the "Merge pull request" button and it offers "Squash and merge", use this.

## Repository Overview

|Directory|Description|
|---|---|
|/documentation|Contains documentation related to this repository and Project Echo GCP cloud deployments.|
|/kubernetes|Contains kubernetes code related to deploying Project Echo services.|
|/terraform|Contains terraform code related to deploying Project Echo on GCP.|

## Reference Technologies & Tools

Used with this repository is the following technologies and software.

- [Terraform CLI](https://developer.hashicorp.com/terraform/install)
- [Google Cloud CLI aka gcloud CLI](https://cloud.google.com/sdk/docs/install)
- [Docker](https://docs.docker.com/desktop/install/windows-install/)
- [Kubernetes command-line tool aka kubectl](https://kubernetes.io/docs/tasks/tools/)

## Related Repositories

- [DataBytes-Organisation/Project-Echo](https://github.com/DataBytes-Organisation/Project-Echo)
