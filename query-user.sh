#!/bin/bash
# usage sh ./query-user.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --index-name gsi1
    --key-condition-expression gsi1pk=:gsi1pk
    --expression-attribute-values {\":gsi1pk\":{\"S\":\"user|id|${3}\"}}
    --max-items 3
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb query ${args}
