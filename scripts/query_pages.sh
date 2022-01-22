#!/bin/bash
curl -X POST 'https://api.notion.com/v1/search' \
  -H 'Authorization: Bearer '"$NOTION_TOKEN"''
  -H 'Content-Type: application/json' \
  -H "Notion-Version: 2022-01-20" \
  --data '{
    "sort":{
      "direction":"ascending",
      "timestamp":"last_edited_time"
    }
  }'
