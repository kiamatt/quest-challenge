#! /bin/bash

set -e

TERRAFORM_DIR="$SCRIPT_DIR/../terraform"

function apply() {
    stack_name=$1
    workspace=$2

    cd "$TERRAFORM_DIR/$stack_name"
    terraform init
    terraform workspace new "$workspace" ||
    terraform workspace select "$workspace"
    terraform apply --var-file "$workspace.tfvars"
}

function set_terraform_outputs() {
    app_output=$(cd "$TERRAFORM_DIR/quest" && terraform output -json)
    task_role_arn=$(echo "$app_output" | jq '.eks_task_role_arn.value')
    certificate_arn=$(echo "$app_output" | jq '.acm_certificate_arn.value')

    export task_role_arn
    export certificate_arn

    eks_environment_output=$(cd "$TERRAFORM_DIR/eks_environment" && terraform output -json)
    alb_controller_role_arn=$(echo "$eks_environment_output" | jq '.alb_controller_role_arn.value')

    export alb_controller_role_arn
}