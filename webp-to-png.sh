#!/bin/bash

# Load configuration from file
source ./config.cfg

# Create output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Monitor input directory for new .webp files
inotifywait -m -e create "$INPUT_DIR" --format '%w%f' |
while read file; do
    # Check if file is a .webp image
    if [[ "$file" == *.webp ]]; then
        # Convert file to .png
        filename=$(basename "$file")
        pngfile="${filename%.*}.png"
        dwebp "$file" -o "$OUTPUT_DIR/$pngfile"
        
        # Delete original .webp file if option is set
        if [[ "$DELETE_WEBP" == "true" ]]; then
            rm "$file"
        fi
    fi
done