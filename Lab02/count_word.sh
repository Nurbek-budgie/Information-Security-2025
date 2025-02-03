#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <file_name> <word>"
    exit 1
fi

FILE=$1
WORD=$2

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

COUNT=$(grep -o -i "\b$WORD\b" "$FILE" | wc -l)

echo "The word '$WORD' appears $COUNT times in the file '$FILE'."
