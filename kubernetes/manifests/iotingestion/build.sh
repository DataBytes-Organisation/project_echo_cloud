#!/bin/bash
docker build . -t iot-ingestion-mqtt --build-arg pubuserpass=$2 --build-arg subuserpass=$3
docker tag iot-ingestion-mqtt australia-southeast2-docker.pkg.dev/sit-23t1-project-echo-25288b9/project-echo/iot-ingestion-mqtt:$1
docker push australia-southeast2-docker.pkg.dev/sit-23t1-project-echo-25288b9/project-echo/iot-ingestion-mqtt:$1
