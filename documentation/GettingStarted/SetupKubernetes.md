# Getting started with Kubernetes & Google Kubernetes Engine

## Overview
This document outlines how to get started with using Kubernetes on the Project Echo service cluster.

## Assumptions
* assumes Setup Terraform For GCP Deployments has been followed and configured. As gcloud cli being installed and authenticated is required.

## Setup Steps
The setup steps will show you how to:
* Install kubectl, the command line application for interacting with kubernetes
* Installing required components into gcloud cli to enable integration with kubectl
* Authenicate kubectl with the service cluster.

### Install kubectl
Go to [kubernetes install tools](https://kubernetes.io/docs/tasks/tools/) and download kubectl for your operating system. Run the installer.

### Install required components for gcloud kubectl integration
Run the following command to install the gcloud kubectl auth plugin.

```
gcloud components install kubectl
```

Enter "Y" and hit enter when prompted as you do want to install the components. That's all it should take.

### Authenicate kubectl with the service cluster.
Run the following command which is actually for gcloud cli, to allow kubectl to authenticate with the service cluster for the project.

```
gcloud container clusters get-credentials project-echo-service-cluster --region=australia-southeast2
```

![gke cluster info](documentation/GettingStarted/gkeclusterinfo.png)

## Reference Links
https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl#install_plugin
https://cloud.google.com/kubernetes-engine/docs/how-to/api-server-authentication
