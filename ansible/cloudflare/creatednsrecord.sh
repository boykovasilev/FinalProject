#!/bin/bash
curl --request 'PUT' \
  --url 'https://api.cloudflare.com/client/v4/zones/4feb7f8b08dd83a81ff5e55afeac6853/dns_records/'$1'/' \
  --header 'Content-Type: application/json' \
  --header 'X-Auth-Email: nedstrike@gmail.com' \
  --header 'X-Auth-Key: 1843a9bcfa413a8eb3a28ed917a206be6e5cc' \
  --data '{
  "content": "'$2'",
  "name": "'$3'",
  "proxied": false,
  "type": "A",  
  "ttl": 360
}'  