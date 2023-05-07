#!/bin/bash

# script should echo current date if run with --date argument
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --date)
            echo $(date)
            shift
        ;;
        *)
            echo "Unknown argument"
            exit 1
        ;;
    esac
done