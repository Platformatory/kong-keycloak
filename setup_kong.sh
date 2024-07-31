#!/bin/bash

set -e

curl -X POST localhost:8001/services -d "name=httpbin" -d "url=http://httpbin.org/anything" | jq

curl -X POST localhost:8001/services/httpbin/routes -d "name=v1app" -d "paths=/v1/app" | jq

curl -X POST localhost:8001/routes/v1app/plugins -d "name=jwt-keycloak" -d "config.allowed_iss=http://keycloak:8080/realms/master" | jq
