#!/bin/bash
curl --request 'POST' \
  --url 'https://api.cloudflare.com/client/v4/zones/ac59335f2c5f49f5d6ad8307c3c2dd32/dns_records/' \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: boyko.i.vasiev@gmail.com' \
  --header 'Authorization: Bearer '$1'' \
  --data '{
  "content": "'$2'",
  "name": "'$3'",
  "proxied": false,
  "type": "A",  
  "ttl": 360
}'  