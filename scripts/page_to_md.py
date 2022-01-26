from markdownify_notion import markdownify_block
import requests
import json 
import os 

config = os.environ
with open("./tils.json", "r") as tils_file:
    tils = json.loads(tils_file.read())

for til in tils:
    url = f"https://api.notion.com/v1/blocks/{til['id']}/children?page_size=100"

    headers = {
        "Accept": "application/json",
        "Notion-Version": "2021-08-16",
        "Authorization": f"Bearer {config['NOTION_TOKEN']}"
    }

    response = requests.request("GET", url, headers=headers)
    blocks = response.json()['results']

    page_md = f"""---
title: {til['title']}
date: {til['created']}
tags: [{', '.join(til['tags'])}]
---
"""
    page_body_list = []
    for block in blocks:
        page_body_list.append(markdownify_block(block))
    
    page_body = "\n".join(page_body_list)
    md_file_str = page_md + page_body

    md_file_name = til['title'].replace(" ", "-")
    with open(f"./output/{md_file_name}.md", "w") as file:
        file.write(md_file_str)