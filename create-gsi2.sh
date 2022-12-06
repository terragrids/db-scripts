#!/bin/bash
# usage sh ./create-gsi2.sh [dev|prod] [local|remote]
# defaults to [prod] [local]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --attribute-definitions AttributeName=gsi2pk,AttributeType=S AttributeName=data,AttributeType=S
    --global-secondary-index-updates file://create-gsi2.json
    "

addEndpointUrlArgs ${2}

echo ${args}

aws dynamodb update-table ${args}
