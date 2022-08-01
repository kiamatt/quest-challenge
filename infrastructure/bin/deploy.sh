#! /bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIR/terraform.sh"
source "$SCRIPT_DIR/kubernetes.sh"
source "$SCRIPT_DIR/tools.sh"

workspace=$1
check_prerequisites "$workspace"

apply account "$workspace"
apply eks_environment "$workspace"
apply quest "$workspace"

set_terraform_outputs
set_eks_cluster
install_eks_bootstrap_chart
install_app_chart

apply dns "$workspace"
