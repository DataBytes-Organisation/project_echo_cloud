# service_cluster
Terraform module to deploy the Google Kubernetes Engine cluster for running Project Echo services. May include other resources relating to running services.

# GKE Cluster Terraform Configuration

This repository contains Terraform configuration files to deploy a Google Kubernetes Engine (GKE) cluster on Google Cloud Platform (GCP). This setup includes creating a GKE cluster, node pools, and the necessary configurations to manage and maintain the infrastructure. The repository is designed to be flexible, allowing easy customization through variables.

## Prerequisites

Before you begin, ensure you have the following installed and set up:

1. **Terraform**: Version 1.0.0 or higher is required. You can download it from the [official website](https://www.terraform.io/downloads.html).
2. **Google Cloud SDK**: This is required to authenticate and interact with GCP. Instructions for installation can be found [here](https://cloud.google.com/sdk/docs/install).
3. **GCP Account**: You need a Google Cloud account with a project set up where you have sufficient permissions to create resources.

## Project Structure

Here’s a breakdown of the key files and their purposes:

### 1. `main.tf`

This is the primary configuration file that defines the GKE cluster and its associated node pool:

- **GKE Cluster (`google_container_cluster`)**:
  - `name`: The name of the GKE cluster, specified by the `service_cluster_name` variable.
  - `location`: The GCP region where the cluster will be deployed, specified by the `gcp_default_region` variable.
  - `remove_default_node_pool`: This removes the default node pool that comes with a new GKE cluster to allow full control over node pools.
  - `initial_node_count`: Sets an initial node count, which is typically minimal because node pools are managed separately.
  - `deletion_protection`: When set to `false`, allows the cluster to be deleted without additional confirmation.

- **Node Pool (`google_container_node_pool`)**:
  - `name`: Specifies the name of the node pool.
  - `location`: The region of the node pool, aligned with the GKE cluster.
  - `cluster`: Links the node pool to the GKE cluster created above.
  - `node_count`: Number of nodes in this pool, adjustable via the `service_cluster_primary_initial_node_count` variable.
  - `node_config`: Defines the configuration for the nodes, including machine type, labels, and tags. Labels and tags are useful for identifying and organizing resources within GCP.

- **Timeouts**: These specify the maximum time Terraform should wait for certain operations, which helps avoid hanging operations during deployment.

### 2. `output.tf`

This file defines the outputs from the Terraform deployment, which are useful for referencing the deployed resources:

- **`cluster_name`**: Outputs the name of the GKE cluster, allowing it to be easily referenced in other configurations or scripts.
- **`endpoint`**: Outputs the endpoint of the GKE cluster, which is essential for interacting with the cluster using `kubectl` or other Kubernetes tools.

### 3. `provider.tf`

This file configures the Terraform providers and the backend for storing state:

- **Terraform Block**:
  - `required_version`: Specifies the minimum required Terraform version to ensure compatibility.
  - `required_providers`: Defines the Google provider, sourced from HashiCorp, with a minimum version to ensure access to the latest features and security updates.

- **Google Provider (`provider "google"`)**:
  - `project`: The GCP project where the resources will be deployed, set using the `gcp_project` variable.
  - `region`: The default region for GCP resources, specified by `gcp_default_region`.
  - `zone`: The default zone for GCP resources, specified by `gcp_default_zone`.

- **Backend Configuration (`backend "gcs"`)**:
  - **Google Cloud Storage (GCS) Backend**: The Terraform state is stored in a GCS bucket to ensure consistent state management across team members and environments. The `bucket` and `prefix` settings define where the state file is stored.

### 4. `state_backend.tf`

This file complements the `provider.tf` by defining additional settings for the Terraform backend. It ensures that the state file is securely stored in the specified GCS bucket, which is critical for managing the infrastructure lifecycle.

### 5. `variables.tf`

This file contains all the input variables used throughout the configuration:

- **`gcp_project`**: The ID of the GCP project where resources will be deployed.
- **`gcp_default_region`**: The default region to deploy resources, used in both the cluster and node pool configurations.
- **`gcp_default_zone`**: The default zone within the specified region for more granular control over resource placement.
- **`service_cluster_name`**: The name of the GKE cluster, customizable to fit different environments or projects.
- **`service_cluster_primary_initial_node_count`**: Specifies the initial number of nodes in the primary node pool, allowing scalability based on workload requirements.
- **`service_cluster_primary_node_type`**: Defines the machine type for the nodes in the GKE cluster, which can be adjusted based on performance and cost considerations.

