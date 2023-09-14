#!/bin/bash
# usage sh ./query-media-items.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --index-name gsi2
    --key-condition-expression gsi2pk=:gsi2pk
    --expression-attribute-values {\":gsi2pk\":{\"S\":\"type|imp-ts\"}}
    --max-items 10
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb query ${args}
