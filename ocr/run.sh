#!/bin/bash

# Loop infinito per monitorare nuove immagini
while true; do
    for img in /data/input/*.jpg; do
        [ -f "$img" ] || continue
        output="/data/output/$(basename "$img" .jpg).txt"
        tesseract "$img" "$output" -c tessedit_char_whitelist=0123456789 --psm 6
        echo "Processed: $img -> $output"
        rm "$img"
    done
    sleep 5
done
