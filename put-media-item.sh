#!/bin/bash
# usage sh ./put-media-item.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --item file://media/media-item1.json
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb put-item ${args}
