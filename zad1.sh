#!/bin/bash

repo_url="https://github.com/Baz00k/narzedzia_pracy_lab4.git"

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

create_errors() {
    error_number=$1
    
    for i in $(seq 1 $error_number); do
        echo "error$i.txt" > error$i.txt
        echo ${0##*/} >> error$i.txt
        echo_date >> error$i.txt
    done
}


display_help() {
    echo "Usage: $0 [option...] {--date|--logs [number]}"
    echo "Options:"
    echo "  --date      display current date"
    echo "  --logs      create log files"
    echo "  number      number of log files to create (default: 100)"
    echo "  -h, --help  display this help and exit"
}

init() {
    git clone $repo_url
    export PATH=$PATH:$(pwd)/narzedzia_pracy_lab4
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
            if [[ -n $2 && ! $2 == -* ]]; then
                create_logs $2
                shift 2
            else
                create_logs 100
                shift
            fi
        ;;
        -e|--errors)
            if [[ -n $2 && ! $2 == -* ]]; then
                create_errors $2
                shift 2
            else
                create_errors 100
                shift
            fi
        ;;
        --init)
            init
            shift
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