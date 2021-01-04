\#!/bin/bash

set -e

usage() {

}

help() {
  usage
  echo
  echo "This is a script template. CHANGEME"
}

parse_flag() {
  echo "$1" | awk -F "=" '{print $2}'
}

while (("$#")); do
  case $1 in
    -h|--help)
      help
      exit 0
      ;;
    -d|--dry-run*)
      FLAG_ARG=$(parse_flag $1)
      if [[ -n $FLAG_ARG ]]; then
        DRY_RUN=$FLAG_ARG
        shift
      else
        DRY_RUN=$2
        shift 2
      fi
      ;;
    -*|--*)
      echo -e "\033[0;91mERROR: Unsupported flag $1\033[0m\n" >&2
      help
      exit 1
      ;;
    *)
      if [[ "${#PARAMS[@]}" == 0 ]]; then
        PARAMS="$1"
      else
        PARAMS="$PARAMS $1"
      fi
      shift
      ;;
  esac
done

eval set -- "$PARAMS"

#==============
# SCRIPT LOGIC
#==============
