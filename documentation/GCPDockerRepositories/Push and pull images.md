# Push and pull images
This document gives an overview of pushing and pulling docker image to the remote repository within a GCP project.


## Assumes
This document assumes the reader:
* has installed gcloud CLI and it is authenticated.
* has docker installed.
* has access to the Project Echo GCP project as Editor (push/pull) or Viewer (pull).
* the reader wishes to push to the project-echo repository created within this repository (root module docker_repository).

## Authentication Setup
To configure authentication within Docker with GCP open a command line or shell and running the following command.

```
gcloud auth configure-docker australia-southeast2-docker.pkg.dev
```

This is all that is required to setup authentication.

## Docker Push
To push an image it should be first tagged with a relevant tag for the remote repository (it helps identify image versions), usually an increment to the next version number. View the image within the Repository project-echo in the GCP console to view the current image tags. After tagging the image can be pushed.

### Tag Image
The command to tag an image is.

```
docker tag <local image name> australia-southeast2-docker.pkg.dev/<project id>/project-echo/<image name in repo>:<tag>
```

<b>local image name</b> is the name of the image locally. IE gotten from docker image list

<b>image name in repo</b> is the name of the image within the GCP repository.

<b>tag</b> is the tag you would like to set. IE a version number like one.

<b>project id</b> is the project id. For Project Echo dev environment this will be sit-23t1-project-echo-25288b9

project-echo is the name of our repository used.

Example.
```
docker tag ts-mongodb australia-southeast2-docker.pkg.dev/sit-23t1-project-echo-25288b9/project-echo/store:1
```

### Push Image
The command to push an image is.

```
docker push australia-southeast2-docker.pkg.dev/<project id>/project-echo/<image name in repo>:<tag>
```

Example.
```
docker push australia-southeast2-docker.pkg.dev/sit-23t1-project-echo-25288b9/project-echo/store:1
```

## Pull image
The command to pull an image is.

```
docker pull australia-southeast2-docker.pkg.dev/<project id>/project-echo/<image name in repo>:<tag>
```

Example.
```
docker pull australia-southeast2-docker.pkg.dev/sit-23t1-project-echo-25288b9/project-echo/store:1
```

## Reference Links
[GCP Storing Docker Images](https://cloud.google.com/artifact-registry/docs/docker/store-docker-container-images)
[GCP Docker Repo Access Control](https://cloud.google.com/artifact-registry/docs/access-control#permissions)
[GCP Push Pull](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling)
