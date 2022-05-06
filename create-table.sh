#!/bin/bash
# usage sh ./scan.sh [dev|prod] [local|remote]
# defaults to [prod] [local]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --attribute-definitions
        AttributeName=pk,AttributeType=S AttributeName=sk,AttributeType=S
    --key-schema
        AttributeName=pk,KeyType=HASH AttributeName=sk,KeyType=RANGE
    --billing-mode PAY_PER_REQUEST"

addEndpointUrlArgs ${2}

echo ${args}

aws dynamodb create-table ${args}