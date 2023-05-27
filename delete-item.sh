#!/bin/bash
# usage sh ./delete-item.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key {\"pk\":{\"S\":\"fileId|0f42af3a-a2b9-43a7-ab00-9fa0d6dbd17e\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb delete-item ${args}
