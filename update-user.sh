#!/bin/bash
# usage sh ./update-user.sh [dev|prod] [local|remote] [assetId]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --key {\"pk\":{\"S\":\"user|oauth|${3}\"}}
    --update-expression set permissions=:p
    --expression-attribute-values file://user/user-values.json
    --return-values ALL_NEW
    "

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb update-item ${args}
