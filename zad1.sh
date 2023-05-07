#!/bin/bash

echo_date() {
    echo $(date)
}

create_logs() {
    # create 100 files logX.txt containing filename, name of the script and current date
    for i in {1..100}; do
        echo "log$i.txt" > log$i.txt
        echo ${0##*/} >> log$i.txt
        echo_date >> log$i.txt
    done
}

# script should echo current date if run with --date argument
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --date)
            echo_date
            shift
        ;;
        --logs)
            create_logs
            shift
        ;;
        *)
            echo "Unknown argument"
            exit 1
        ;;
    esac
done