# iotingestion

## Overview
This directory contains the manifest files for the IOT ingestion backend service. It is an external (public) facing service.

## Manifests
|Manifest|Description|
|---|---|
|iot-ingestion-service|This contains the deployment, backend config and service to deploy the IOT ingestion MQTT broker service.|
|iot-ingress|This specifies the ingress to cluster and settings that configure the external (public) facing load balancer with an SSL certificate for the service.|

## Related resources
Within this directory at terraform/root_modules/dns_and_ssl the DNS A record (hostname) and external static IP resource for the iot ingestion backend are defined.

The Project Echo IoT repository includes the docker file for the image that is used by this service. The built image is to be pushed to the docker respository created by the docker_repository terraform root module.

### Docker Image Build Script
To assist with building and pushing the image to the repository a script called build.sh is here. It accepts arguments for a tag to push the image with and passwords for both the pubuser and subuser.

To run change to this directory and run the following command.

```sh
./build.sh <image tag> <pub user password> <sub user password>
```

IE. The following builds an image with tag 5, ETC1234 for pub user password and ETC5432 for sub user password.

```sh
./build.sh 5 ETC1234 ETC5432
```

## Deploy Steps
At a high level to deploy the iot ingestion backend service:
* Build the iot-ingestion docker image and push to project echo GCP repository.
* Deploy the terraform root module dns_and_ssl to create static external IP and DNS A record.
* Change working directory to this one
* Deploy the iot-ingestion-service manifest
* Deploy the iot-ingress manifest

### Requirements
* kubectl with gcloud auth to the project must be in place
* the dns_and_ssl terraform root module must have the resources deployed to the project
* the iot-ingestion docker image must be within the repository deployed by terraform/root_modules/docker_repository and the referenced tag within the container definition must exist.

### Commands
```sh
cd kubernetes/manifests/iotingestion
kubectl apply -f iot-ingestion-service.yaml
kubectl apply -f iot-ingress.yaml
```

## Reference links
https://github.com/DataBytes-Organisation/Project-Echo-IoT