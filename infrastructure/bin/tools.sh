#! /bin/bash

set -e

function check_prerequisites() {
  workspace_exists "$1"
  workspace_corresponds_to_aws_profile "$1"
  required_tools_installed
}

function workspace_exists() {
  if [ -z "$1" ]; then
    echo "please pass a workspace name"
    exit
  fi
}

function workspace_corresponds_to_aws_profile() {
  if [[ "$(aws configure list-profiles)" != *"$1"* ]]; then
    echo "please ensure the workspace passed corresponds to a locally-configured AWS profile"
    exit
  fi
}

function required_tools_installed() {
  if ! command -v aws &> /dev/null
  then
      echo "please install the AWS CLI"
      exit
  fi

  if ! command -v kubectl &> /dev/null
  then
      echo "please install kubectl"
      exit
  fi

  if ! command -v helm &> /dev/null
  then
      echo "please install helm"
      exit
  fi
}