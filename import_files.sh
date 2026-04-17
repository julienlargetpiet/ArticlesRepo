#!/usr/bin/env bash

BASE_URL="https://julienlargetpiet.tech"

OUTPUTDIR="common_files"

# while there is at least one arg left
while [[ $# -gt 0 ]]; do
    case "$1" in
        -o )
            OUTPUTDIR="${2}/common_files"
            shift 2 # it consumes the next 2 args, so go straight to the intended end 
            ;;
        *)
            shift # ignores by just consuming an arg
            ;;
    esac
done

mkdir -p $OUTPUTDIR

GRPVAR="lynx1"

stx file list | grep "$GRPVAR" | while IFS=$'\t' read -r path size; do
  [[ -z "$path" ]] && continue

  clean_path="${path#*common_files/}"

  [[ "$clean_path" == "$path" ]] && continue

  local_path="${OUTPUTDIR}/${clean_path}"

  mkdir -p "$(dirname "$local_path")"

  wget -O "$local_path" "$BASE_URL/$path"

  echo "Downloaded: $path -> $local_path"
done


