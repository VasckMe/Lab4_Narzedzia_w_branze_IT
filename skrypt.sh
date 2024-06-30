#!/bin/bash

if [ "$1" == "--date" ]; then
    date
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi
