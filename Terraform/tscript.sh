#!/bin/bash

# Variables
GCS_BUCKET_NAME=test-bucketose
TFVARS_FILE=terraform.tfvars

# Download terraform.tfvars from GCS
gsutil cp gs://${GCS_BUCKET_NAME}/${TFVARS_FILE} .

# Run Terraform commands
terraform init
terraform apply -var-file=${TFVARS_FILE}
