#! /bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIR/terraform.sh"
source "$SCRIPT_DIR/kubernetes.sh"
source "$SCRIPT_DIR/tools.sh"

workspace=$1
check_prerequisites "$workspace"

delete_app_chart
delete_eks_bootstrap_chart
