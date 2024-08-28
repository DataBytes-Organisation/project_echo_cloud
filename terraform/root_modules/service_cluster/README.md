# GKE Service Cluster Terraform Module

## Overview

This Terraform module is designed to deploy a Google Kubernetes Engine (GKE) cluster for running Project Echo services. The module also includes configurations for custom service accounts and node pools, including preemptible nodes for cost-effective operations.

## Features

- **Google Kubernetes Engine (GKE) Cluster**: Deploys a GKE cluster in the specified Google Cloud project.
- **Custom Service Account**: Creates a custom service account for use with GKE node pools, with the appropriate OAuth scopes.
- **Managed Node Pool**: Configures a standard managed node pool with customizable machine types, labels, and tags.
- **Preemptible Node Pool**: Sets up a cost-effective node pool using preemptible instances.

## Directory Structure

The module directory is structured as follows:


### Files

- **`versions.tf`**: Specifies the required Terraform version and providers.
- **`variables.tf`**: Contains all input variables required by the module.
- **`main.tf`**: Defines the resources to be deployed, including the GKE cluster, service account, and node pools.
- **`outputs.tf`**: Defines the outputs of the module, such as the cluster name and endpoint.

## Usage

### Prerequisites

- Terraform installed on your local machine.
- A Google Cloud project with billing enabled.
- A service account credentials JSON file for authentication.

### Example Usage

```hcl
module "gke_cluster" {
  source                = "./root_modules/service_cluster"
  region                = "us-central1"
  cluster_name          = "my-echo-cluster"
  credentials_file_path = "/path/to/your/credentials.json"
}

### Inputs
region: The region where the GKE cluster will be deployed. Default is us-central1.
cluster_name: The name of the GKE cluster.
credentials_file_path: Path to the Google Cloud service account credentials JSON file.
service_account_id: The ID of the service account to be created. Default is service-account-id.
service_account_display_name: The display name of the service account. Default is Service Account.
initial_node_count: The initial number of nodes in the default node pool. Default is 3.
preemptible_node_count: The number of preemptible nodes in the managed node pool. Default is 1.
machine_type: The machine type for the GKE nodes. Default is e2-medium.
Outputs
cluster_name: The name of the GKE cluster.
endpoint: The GKE cluster endpoint.
service_account_email: The email of the created service account.
