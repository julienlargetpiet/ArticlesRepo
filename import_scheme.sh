
stx subjects | while IFS= read -r line; do
    [[ -z $line ]] && continue
  if [[ "$line" =~ ^([0-9]+)[[:space:]]+(.*)$ ]]; then
    title="${BASH_REMATCH[2]}"
  else
    echo "Skipping unparsable line: $line" >&2
    continue
  fi

  echo "stx subject add $title" >> scheme.sh  

done
