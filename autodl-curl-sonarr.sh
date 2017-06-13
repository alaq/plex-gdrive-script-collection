#!/bin/bash

title=$1
downloadUrl=$2
apiKey=$3
date=$(date -u +"%Y-%m-%d %H:%M:%SZ")

{
/usr/bin/curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Api-Key: $apiKey" -X POST -d '{"title":"'"$title"'","downloadUrl":"'"$downloadUrl"'","downloadProtocol":"torrent","publishDate":"'"$date"'"}' http://localhost:40001/api/release/push
} &> /dev/null
