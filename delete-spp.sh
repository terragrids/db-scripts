#!/bin/bash
# usage sh ./delete-spp.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key {\"pk\":{\"S\":\"spp\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb delete-item ${args}
