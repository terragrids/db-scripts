#!/bin/bash
# usage sh ./delete-item.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key {\"pk\":{\"S\":\"media|detachedHouse3\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb delete-item ${args}
