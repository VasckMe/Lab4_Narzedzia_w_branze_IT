#!/bin/bash

SCRIPT_NAME=$(basename "$0")

function create_logs {
    local count=$1
    for ((i = 1; i <= count; i++)); do
        FILE_NAME="log${i}.txt"
        echo "Nazwa: $FILE_NAME" > "$FILE_NAME"
        echo "Nazwa skryptu $SCRIPT_NAME" >> "$FILE_NAME"
        echo "Data utworzenia: $(date)" >> "$FILE_NAME"
    done
}

if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
    create_logs 100
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi
