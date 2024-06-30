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

function display_help {
	echo "Dostępne opcje:"
	echo "--date, -d       	Wyświetla dzisiejszą datę"
	echo "--logs, -l [N]	Tworzy N plików logx.txt (domyślnie 100)"
	echo "--help, -h       	Wyświetla wszystkie dostępne opcje"
}

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    if [ -n "$2" ]; then
        create_logs "$2"
    else
        create_logs 100
    fi
elif [[ "$1" == "--init" ]]; then
    git clone . $(pwd)
    export PATH=$(pwd):$PATH
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_help
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi
