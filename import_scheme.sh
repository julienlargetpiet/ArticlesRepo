
OUTPUTDIR="."

# while there is at least one arg left
while [[ $# -gt 0 ]]; do
    case "$1" in
        -o )
            OUTPUTDIR="$2"
            shift 2 # it consumes the next 2 args, so go straight to the intended end 
            ;;
        *)
            shift # ignores by just consuming an arg
            ;;
    esac
done

stx subjects | while IFS= read -r line; do
    [[ -z $line ]] && continue
  if [[ "$line" =~ ^([0-9]+)[[:space:]]+(.*)$ ]]; then
    title="${BASH_REMATCH[2]}"
  else
    echo "Skipping unparsable line: $line" >&2
    continue
  fi

  echo "stx subject add $title" >> "${OUTPUTDIR}/scheme.sh"

done
