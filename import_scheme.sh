#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(pwd)"
OUTPUTDIR="$SCRIPT_DIR"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -o)
      [[ $# -lt 2 ]] && { echo "Missing value for -o"; exit 1; }
      OUTPUTDIR="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

mkdir -p "$OUTPUTDIR"
SCHEME_FILE="$OUTPUTDIR/scheme.sh"
: > "$SCHEME_FILE"

while IFS= read -r line; do
  [[ -z "$line" ]] && continue

  if [[ "$line" =~ ^([0-9]+)[[:space:]]+(.*)$ ]]; then
    title="${BASH_REMATCH[2]}"
  else
    echo "Skipping unparsable line: $line" >&2
    continue
  fi

  echo "stx subject add \"$title\"" >> "$SCHEME_FILE"

done < <(stx subjects)
