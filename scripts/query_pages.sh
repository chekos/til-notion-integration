#!/bin/bash

curl --request POST \
     --url https://api.notion.com/v1/search \
     --header 'Accept: application/json' \
     --header 'Authorization: Bearer '"$NOTION_TOKEN"'' \
     --header 'Content-Type: application/json' \
     --header 'Notion-Version: 2022-01-20' \
     --data '{"page_size":100}'
