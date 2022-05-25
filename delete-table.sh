#!/bin/bash
# usage sh ./scan.sh [dev|prod] [local|remote]
# defaults to [prod] [local]
source ./common.sh

getTable ${1}

args="--table-name ${table}"

addEndpointUrlArgs ${2}

echo ${args}

aws dynamodb delete-table ${args}