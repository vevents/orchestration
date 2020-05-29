#!/bin/sh
#####################################################################################
# This script creates a Kubernetes cluster using the supplied command line arguments.
# It assumes you have an AWS account, have configured an IAM user with the necessary
# permissions, have created AWS CLI credentials for the user, and have an instance
# running in AWS where you can issue the necessary commands.
#
# For help getting started, see https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html
#
#####################################################################################
if [ "$#" -ne 5 ]; then
   echo "Incorrect number of arguments ($#), usage:"
   echo "$1 <cluster name> <EC2 region> <EC2 node type> <number of nodes> <ssh key file>"
   echo "Example: $0 myK8sCluster us-east-2 t3.medium 3 mykey.pem"
else
   echo "Creating cluster"
   /usr/bin/eksctl create cluster --name $1 --version 1.16 --region $2 --nodegroup-name workers --node-type $3 --nodes $4 --nodes-min 1 --nodes-max 4 --ssh-access --ssh-public-key $5 --managed
fi
