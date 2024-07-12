#!/bin/sh

terraform init
TF_VAR_resource_group_name=$RESOURCE_GROUP_NAME terraform apply -input=false -compact-warnings -auto-approve