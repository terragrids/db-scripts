#!/bin/bash
# usage sh ./delete-gsi1.sh [dev|prod] [local|remote]
# defaults to [prod] [local]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --attribute-definitions AttributeName=gsi1pk,AttributeType=S AttributeName=data,AttributeType=S
    --global-secondary-index-updates file://delete-gsi1.json
    "

addEndpointUrlArgs ${2}

echo ${args}

aws dynamodb update-table ${args}
