---
title: jq [] syntax
date: 2022-01-25T23:15:00.000Z
tags: [jq, shell]
---
## what i learned
If you want to dump a list of objects you’re constructing from some other json you need to wrap your entire `jq` string in square brackets ( `[]` ). Otherwise you’ll be writing each object one at a time and that’s not valid JSON.
## how i learned
Testing the `til-notion-integration` and `markdownify-notion` I tried reading a list of tils I had saved in a JSON file. However, each object was separated by a new line - not a comma.
## reference
The solution (after many failed google searches) was found here →
[Alt text](https://github.com/stedolan/jq/issues/124#issuecomment-17875972)