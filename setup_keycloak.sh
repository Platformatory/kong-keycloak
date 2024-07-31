#!/bin/bash

set -e

export ADMIN_TOKENS=$(curl -s -X POST \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "grant_type=password" \
-d "client_id=admin-cli" \
-d "username=admin" \
-d "password=keycloak" \
http://localhost:8080/realms/master/protocol/openid-connect/token)

export ADMIN_ACCESS_TOKEN=$(echo ${ADMIN_TOKENS} | jq -r ".access_token")

export CLIENT_ID=test-kong-client
export CLIENT_SECRET=tMthAM8jcRKnFA8HmOgO3n1uwIJUbCMW

curl -X POST http://localhost:8080/admin/realms/master/clients \
-H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" \
-H "Content-Type: application/json" \
-d '{ "clientId": "'"${CLIENT_ID}"'", "clientAuthenticatorType": "client-secret", "name": "Test Kong Client", "secret": "'"${CLIENT_SECRET}"'", "serviceAccountsEnabled": true, "id": "'"${CLIENT_ID}"'" }'

curl -H "Authorization: Bearer ${ADMIN_ACCESS_TOKEN}" http://localhost:8080/admin/realms/master/clients/${CLIENT_ID} | jq
