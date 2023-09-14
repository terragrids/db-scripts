#!/bin/bash
# usage sh ./get-place.sh [dev|prod] [local|remote] [projectId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key {\"pk\":{\"S\":\"place|${3}\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb get-item ${args}
