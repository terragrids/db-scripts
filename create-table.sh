#!/bin/bash
# usage sh ./create-table.sh [dev|prod] [local|remote]
# defaults to [prod] [local]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --attribute-definitions AttributeName=pk,AttributeType=S
    --key-schema AttributeName=pk,KeyType=HASH
    --billing-mode PAY_PER_REQUEST"

addEndpointUrlArgs ${2}

echo ${args}

aws dynamodb create-table ${args}