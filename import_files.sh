#!/usr/bin/env bash

BASE_URL="https://julienlargetpiet.tech"

mkdir -p common_files

GRPVAR="lynx1"

stx file list | grep "$GRPVAR" | while IFS=$'\t' read -r path size; do
  [[ -z "$path" ]] && continue

  clean_path="${path#*common_files/}"

  [[ "$clean_path" == "$path" ]] && continue

  local_path="common_files/$clean_path"

  mkdir -p "$(dirname "$local_path")"

  wget -O "$local_path" "$BASE_URL/$path"

  echo "Downloaded: $path -> $local_path"
done


