#!/bin/sh

az login --service-principal -u $AZ_CLIENT_ID -p $AZ_CLIENT_SECRET --tenant $AZ_TENANT_ID
terraform init
TF_VAR_resource_group_name=$RESOURCE_GROUP_NAME terraform apply -input=false -compact-warnings -auto-approve
az logout