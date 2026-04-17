#!/usr/bin/env bash

BASE_URL="https://julienlargetpiet.tech"

SCRIPT_DIR="$(pwd)"
OUTPUTDIR="$SCRIPT_DIR/common_files"

GRPVAR="."

# while there is at least one arg left
while [[ $# -gt 0 ]]; do
  case "$1" in
    -o)
      [[ $# -lt 2 ]] && { echo "Missing value for -o"; exit 1; }
      OUTPUTDIR="$2"
      shift 2
      ;;
    -e)
      [[ $# -lt 2 ]] && { echo "Missing value for -e"; exit 1; }
      GRPVAR="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

mkdir -p "$OUTPUTDIR"

stx file list | grep "$GRPVAR" | while IFS=$'\t' read -r path size; do
  [[ -z "$path" ]] && continue

  clean_path="${path#*common_files/}"

  [[ "$clean_path" == "$path" ]] && continue

  local_path="${OUTPUTDIR}/${clean_path}"

  mkdir -p "$(dirname "$local_path")"

  wget -O "$local_path" "$BASE_URL/$path"

  echo "Downloaded: $path -> $local_path"
done


