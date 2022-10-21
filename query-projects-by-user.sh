#!/bin/bash
# usage sh ./query-projects-by-user.sh [dev|prod] [local|remote] [user-wallet]
# defaults to [prod] [local] [null]

source ./common.sh

getTable ${1}
getEndpointUrl ${2}

set -x

aws dynamodb query \
    --table-name ${table} \
    --index-name gsi1 \
    --key-condition-expression "gsi1pk=:gsi1pk and begins_with(#data,:project)" \
    --expression-attribute-names '{"#data":"data"}' \
    --expression-attribute-values '{":gsi1pk":{"S":"user|6NUTHHYXD554OITJU6B6WWCXVG7BWM7BU3KG2DOYG45JWYBER3UFZKCQ7E"},":project":{"S":"project|"}}' \
    --return-consumed-capacity TOTAL \
    ${endpointUrl}
