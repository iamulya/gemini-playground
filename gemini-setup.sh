#!/bin/bash

#setup project and region
PROJECT_ID=$(gcloud config get-value project)
REGION=us-central1
echo "PROJECT_ID=${PROJECT_ID}"
echo "REGION=${REGION}"

#setup user
USER=$(gcloud config get-value account 2> /dev/null)
echo "USER=${USER}"

#enable Gemini / Cloud AI Companion
gcloud services enable cloudaicompanion.googleapis.com --project ${PROJECT_ID}

#add necessary role bindings
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member user:${USER} --role=roles/cloudaicompanion.user
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member user:${USER} --role=roles/serviceusage.serviceUsageViewer

