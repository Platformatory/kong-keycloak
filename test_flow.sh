#!/bin/bash

set -e

export CLIENT_ID=test-kong-client
export CLIENT_SECRET=tMthAM8jcRKnFA8HmOgO3n1uwIJUbCMW

export TOKENS=$(curl -s -X POST \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "grant_type=client_credentials" \
-d "client_id=${CLIENT_ID}" \
-d "client_secret=${CLIENT_SECRET}" \
http://localhost:8080/realms/master/protocol/openid-connect/token)

export ACCESS_TOKEN=$(echo ${TOKENS} | jq -r ".access_token")

curl -H "Authorization: Bearer ${ACCESS_TOKEN}" http://localhost:8000/v1/app
