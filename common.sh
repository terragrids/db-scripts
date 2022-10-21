#!/bin/bash
getTable() {
    local env=${1-prod}

    if [[ $env = prod ]]
    then
        table=terragrids
    else
        table=terragrids-dev
    fi
}

localEndpointUrl='--endpoint-url http://localhost:8000'

getEndpointUrl() {
    local endpoint=${1-local}

    if [[ $endpoint = 'local' ]]
    then
        endpointUrl=${localEndpointUrl}
    fi
}

addEndpointUrlArgs() {
    local endpoint=${1-local}

    if [[ $endpoint = 'local' ]]
    then
        args+=" ${localEndpointUrl}"
    fi
}
