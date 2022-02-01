#!/bin/bash

curl --request POST \
--url https://api.notion.com/v1/databases/$TIL_DATABASE_ID/query \
--header 'Accept: application/json' \
--header 'Authorization: Bearer '"$NOTION_TOKEN"'' \
--header 'Content-Type: application/json' \
--header 'Notion-Version: 2021-08-16' \
--data '{"page_size":100, "filter": {
  "and": [
    {
      "property": "Draft",
      "checkbox": {
        "equals": false
      }
    },
    {
      "property": "Archive",
      "checkbox": {
        "equals": false
      }
    }
  ]
}
}' \
| jq '[.results[] | {id: .id, title: .properties.Name.title[0].text.content, tags: [.properties.Tags.multi_select[].name], created: .properties.Created.created_time }]' \
> tils.json
