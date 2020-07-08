#!/bin/bash -e
# Any commands which fail will cause the shell script to exit immediately
set -e

# See the commands executed in the command window
set -x

# Change working directory to this script location
cd "$(dirname "$0")"

source ./kube-config.sh

# Create Namespace if it doesn't already exist
kubectl create namespace ${KUBE_NAMESPACE} || true

# Configure kubectl to use namespace
kubectl config set-context --current --namespace=${KUBE_NAMESPACE}

# Create a timestamp to inject into the deployment to force redeployment everytime
export DEPLOY_TIMESTAMP=`date +'%s'`

# Replace variables and Deploy config files
for f in manifests/*.yml ; do envsubst < "$f" | kubectl apply -f - ; done