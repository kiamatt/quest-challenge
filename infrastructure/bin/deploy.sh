#! /bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIR/terraform.sh"
source "$SCRIPT_DIR/kubernetes.sh"
source "$SCRIPT_DIR/tools.sh"

workspace=$1

check_prerequisites "$workspace" # Ensure prerequisites are met

# Terraform
apply_terraform_stack account "$workspace" # Apply account-level Terraform
apply_terraform_stack eks_environment "$workspace" # Apply AWS EKS-level Terraform
apply_terraform_stack quest "$workspace" # Apply application-level Terraform
set_terraform_outputs # Grab needed Terraform outputs for Kubernetes

# Kubernetes
set_eks_cluster # Use the created AWS EKS cluster
install_eks_bootstrap_chart # Install one-time EKS resources
install_app_chart # Install the quest app in EKS

# Terraform
apply_terraform_stack dns "$workspace" # Apply DNS-level Terraform
