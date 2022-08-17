#!/bin/bash
# usage sh ./put-terracells.sh [dev|prod] [local|remote]
# defaults to [prod] [local] [null]
source ./common.sh

getTable ${1}

args="
    --table-name ${table}
    --item {\"pk\":{\"S\":\"asset|105287990\"},\"symbol\":{\"S\":\"TRCL\"},\"offchainUrl\":{\"S\":\"https://images.terragrids.org/16708fa3-fc1e-4115-8376-174d7f043b20\"},\"power\":{\"N\":\"15\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb put-item ${args}


args="
    --table-name ${table}
    --item {\"pk\":{\"S\":\"asset|105292633\"},\"symbol\":{\"S\":\"TRCL\"},\"offchainUrl\":{\"S\":\"https://images.terragrids.org/bb0c380f-2bc1-4632-ab02-28c2916d5c1e\"},\"power\":{\"N\":\"20\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb put-item ${args}


args="
    --table-name ${table}
    --item {\"pk\":{\"S\":\"asset|105424991\"},\"symbol\":{\"S\":\"TRCL\"},\"offchainUrl\":{\"S\":\"https://images.terragrids.org/e51f2c29-c9c4-4d09-8392-ac66b271c428\"},\"power\":{\"N\":\"10\"}}
    --return-consumed-capacity TOTAL"

addEndpointUrlArgs ${2}

echo ${args}
aws dynamodb put-item ${args}
