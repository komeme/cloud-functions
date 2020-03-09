#!/usr/bin/env bash

set -o errexit
set -o nounset
set -x

FUNCTION_NAME=hello_world
PROJECT_NAME=comeme

gcloud config set project ${PROJECT_NAME}
gcloud functions deploy ${FUNCTION_NAME} \
    --env-vars-file .env.yaml \
    --source build \
    --region asia-northeast1 \
    --runtime nodejs8 \
    --entry-point=exec \
    --trigger-http