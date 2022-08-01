#! /bin/bash

set -e

KUBERNETES_DIR="$SCRIPT_DIR/../kubernetes"

function set_eks_cluster() {
  AWS_PROFILE="$workspace" aws eks update-kubeconfig --region $(aws configure get region) --name services --profile "$workspace"
	kubectl set env daemonset aws-node -n kube-system ENABLE_POD_ENI=true
}

function install_eks_bootstrap_chart() {
    cd "$KUBERNETES_DIR/bootstrap"
    helm -n kube-system install bootstrap \
    --set "awsLoadBalancer.iamRoleArn=$alb_controller_role_arn" .
}

function install_app_chart() {
    cd "$KUBERNETES_DIR/app"
    helm -n "$workspace" install \
    --create-namespace quest \
    --set "awsLoadBalancer.certArn=$certificate_arn" \
    --set "serviceAccount.iamRoleArn=$task_role_arn" \
    --set "image.tag=1.1.0" \
    -f "./values-$workspace.yaml" .
}

function delete_eks_bootstrap_chart() {
    cd "$KUBERNETES_DIR/bootstrap"
    helm -n kube-system delete bootstrap || echo "bootstrap release doesn't exist"
}

function delete_app_chart() {
    cd "$KUBERNETES_DIR/app"
    helm -n "$workspace" delete quest || echo "quest release doesn't exist"
}
