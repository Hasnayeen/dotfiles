#!/bin/bash

# Input and output file paths
colors_file="$HOME/.cache/wal/colors"
config_file="$HOME/.config/starship.toml"

# Check if input file exists
if [ ! -f "$colors_file" ]; then
    echo "Error: Colors file '$colors_file' not found."
    exit 1
fi

# Backup the original configuration file
config_backup="${config_file}.bak"
cp "$config_file" "$config_backup" || {
    echo "Error: Failed to create a backup of the configuration file."
    exit 1
}

# Counter for color index
color_index=0

# Loop through each line in the colors file
while IFS= read -r color_value; do
    # Perform replacement in the configuration file
    if grep -q "color$color_index=" "$config_file"; then
        sed -i -e "s/color$color_index=\"[^\"]*\"/color$color_index=\"$color_value\"/" "$config_file"
        color_index=$((color_index + 1))
    else
        echo "Warning: Color index $color_index not found in the configuration file."
    fi
done < "$colors_file"

