#!/bin/bash
echo "UserName :"
read usr
echo "Password :"
read pas
KC_CLIENT_ID=apigateway
KC_ISSUER=http://localhost:8180/auth/realms/quarkus

# Simple test user
KC_USERNAME=$usr
KC_PASSWORD=$pas

KC_RESPONSE=$( \
curl \
  --insecure -X POST \
  --user backend-service:secret \
  -H 'content-type: application/x-www-form-urlencoded' \
  -d "client_id=$KC_CLIENT_ID" \
  -d "username=$KC_USERNAME" \
  -d "password=$KC_PASSWORD" \
  -d "grant_type=password" \
  "$KC_ISSUER/protocol/openid-connect/token" \
)
echo $KC_RESPONSE | jq -C .

KC_ACCESS_TOKEN=$(echo $KC_RESPONSE | jq -r .access_token)

# Try to call endpoints - /data/user should work, /data/admin should fail
curl -v -H "Authorization: Bearer $KC_ACCESS_TOKEN" http://localhost:8082/api/admin
curl -v -H "Authorization: Bearer $KC_ACCESS_TOKEN" http://localhost:8082/api/users/me
curl -v -H "Authorization: Bearer $KC_ACCESS_TOKEN" http://localhost:8082/api/sample/1.0
