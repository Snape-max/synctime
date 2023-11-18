#!/bin/bash

api_url="http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp"

json_text=$(curl -s "$api_url")

if [ $? -ne 0 ]; then
  echo "Error: Unable to fetch JSON from $api_url."
  exit 1
fi

timestamp=$(echo "$json_text" | grep -oP '"t":"\K[0-9]+')

if [ -z "$timestamp" ]; then
  echo "Error: Unable to extract timestamp from JSON response."
  exit 1
fi

formatted_date=$(date -d "@$((timestamp / 1000))" "+%Y%m%d %H:%M:%S")

if [ $? -ne 0 ]; then
  echo "Error: Unable to format date."
  exit 1
fi

sudo date -s "$formatted_date"

if [ $? -ne 0 ]; then
  echo "Error: Unable to set system date."
  exit 1
fi

echo "System date successfully updated to: $formatted_date"