#!/bin/bash

echo_date() {
    echo $(date)
}

create_logs() {
    log_number=$1
    
    for i in $(seq 1 $log_number); do
        echo "log$i.txt" > log$i.txt
        echo ${0##*/} >> log$i.txt
        echo_date >> log$i.txt
    done
}


display_help() {
    echo "Usage: $0 [option...] {argument...}"
    echo "Options:"
    echo "-d, --date      display current date"
    echo "-l, --logs      create logs with given number of files (default 100)"
    echo "-h, --help      display help"
    echo "Example:"
    echo "$0 -d -l 10"
}

# script should echo current date if run with --date argument
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -d|--date)
            echo_date
            shift
        ;;
        -l|--logs)
            if [[ -n $2 && ! $2 == -* ]]; then
                create_logs $2
                shift 2
            else
                create_logs 100
                shift
            fi
        ;;
        -h|--help)
            display_help
            exit 0
        ;;
        *)
            echo "Unknown argument $key"
            exit 1
        ;;
    esac
done