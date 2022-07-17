#!/bin/bash
# usage sh ./list-tables.sh [dev|prod] [local|remote]
# defaults to [prod] [local]
source ./common.sh

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb list-tables ${args}