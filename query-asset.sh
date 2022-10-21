#!/bin/bash
# usage sh ./query-asset.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key-condition-expression pk=:pk
    --expression-attribute-values {\":pk\":{\"S\":\"asset|${3}\"}}
    --max-items 3
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb query ${args}
