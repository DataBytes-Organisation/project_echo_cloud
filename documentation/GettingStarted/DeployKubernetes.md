# DeployKubernetes

## Overview
This document outlines some basic commands to get started with deploying to the Project Echo service cluster using Kubernetes.

## Assumptions
This document assumes that kubectl is installed and configured with GCP authentication for the project.

## Deploy a manifest file
To deploy resources within a .yaml file (a manifest file) ensure you are within the directory where the file is located and use the following command.

```sh
kubectl apply -f <yaml file name>
```

IE. The following command deploys the iot-ingress.yaml file which creates an Ingress resource on the cluster.

```sh
kubectl apply -f iot-ingress.yaml
```

### Delete resource
To delete a resource is different to deploying a manifest file.

```sh
kubectl delete <resource type> <resource name>
```

IE. The follow example deletes the iot-ingestion service on the service cluster.

```sh
kubectl delete service iot-ingestion
```

## Reference links
https://kubernetes.io/docs/tutorials/kubernetes-basics/deploy-app/deploy-intro/
https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer
