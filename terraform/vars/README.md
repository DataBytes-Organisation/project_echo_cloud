# vars
This directory contains Terraform variables files (.tfvars extension).

## tfvars files
A tfvars file is available to specify common variables (those used by all environments) and there's also tfvars files available to specify different variables for dev, sit and prod environments.

|Directory|Description|
|---|---|
|common.tfvars|Variables with values common to all environments.|
|dev.tfvars|Variables with values specific to the dev environment.|
|sit.tfvars|Variables with values specific to the sit environment.|
|prod.tfvars|Variables with values specific to the prod environment.|

### Examples
An example of a common variable is that of the name of the Echo API service. It is common as it does not change between environments.

common.tfvars
```
echo_api_service_name = "echo-api"
```

<br>

An example of a variable that differs between environments is gcp_project. As we plan on using a different project per environment this will change between environments.

dev.tfvars
```
gcp_project = "sit-23t1-project-echo-25288b9" # this is the actual current project Id for Project Echo
```

sit.tfvars
```
gcp_project = "sit2-23t1-project-echo-asdf123"
```

prod.tfvars
```
gcp_project = "prod-23t1-project-echo-bcde234"
```


## Guidelines

* Do not store secret values such as passwords or API keys within tfvars.
* Use terraform -fmt on your code including variables to ensure it follows proper styling.
