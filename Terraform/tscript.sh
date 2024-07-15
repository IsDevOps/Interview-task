#!/bin/bash

# Variables
GCS_BUCKET_NAME=test-bucket557
TFVARS_FILE=terraform.tfvars
TFSTATE_FILE=terraform.tfstate
TFSTATE_BK=terraform.tfstate.backup


# Download terraform.tfvars from GCS
gsutil cp gs://${GCS_BUCKET_NAME}/${TFVARS_FILE} .
gsutil cp gs://${GCS_BUCKET_NAME}/${TFSTATE_FILE} .
gsutil cp gs://${GCS_BUCKET_NAME}/${TFSTATE_BK} .


# Run Terraform commands
terraform init
terraform apply -var-file=${TFVARS_FILE}
