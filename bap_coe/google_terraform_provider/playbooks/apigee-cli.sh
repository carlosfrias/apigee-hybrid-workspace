#!/usr/bin/env bash

export PROJECT_ID=friasc-xl7xlb-04062022-1059
export AUTH="Authorization: Bearer $(gcloud auth print-access-token)"
export SUBNET=default
export INSTANCE_NAME=INSTANCE_NAME
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")

