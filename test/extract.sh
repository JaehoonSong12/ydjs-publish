#!/bin/bash
set -e

if ! command -v unzip &> /dev/null; then
    echo "Error: 'unzip' command is not found."
    exit 1
fi

for zip_file in *.zip; do
    if [ -e "$zip_file" ]; then
        unzip -q "$zip_file" -d "${zip_file%.zip}"
    fi
done
