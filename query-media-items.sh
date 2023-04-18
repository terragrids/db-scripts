#!/bin/bash
# usage sh ./query-media-items.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]

source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --index-name gsi1
    --key-condition-expression gsi1pk=:gsi1pk
    --expression-attribute-values {\":gsi1pk\":{\"S\":\"type|place\"}}
    --max-items 5
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb query ${args}
