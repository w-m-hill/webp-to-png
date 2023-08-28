#!/bin/bash

command_exists()
{
    command -v -- "$1" >/dev/null 2>&1
}

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
        if command_exists dwebp
        then
            dwebp "$file" -o "$OUTPUT_DIR/$pngfile"
        elif command_exists convert
        then
            convert -verbose "$file" "$OUTPUT_DIR/$pngfile"
        elif command_exists gm
        then
            gm convert -verbose "$file" "$OUTPUT_DIR/$pngfile"
        else
            echo "Can't convert .webp image: no appropriate tool found!"
            false # failed
        fi

        # Make sure to delete the file only if conversion succeeded.
        if [ $? -eq 0 ]; then
            # Delete original .webp file if option is set
            if [[ "$DELETE_WEBP" == "true" ]]; then
                rm "$file"
            fi
        fi
    fi
done