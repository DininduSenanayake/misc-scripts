#!/bin/bash

# Read the source directory
SOURCE_DIR="/nesi/project/nesi02659/mgsr_2025/starter_files"

# Read userIDs  from user.txt
while IFS= read -r target_dir; do
    # Skip empty lines
    if [ -z "$target_dir" ]; then
        continue
    fi
    
    echo "Copying to: $target_dir"
    
    # Copy all items from source to target directory
    cp -r "$SOURCE_DIR"/* "$target_dir/"
    
    if [ $? -eq 0 ]; then
        echo "Successfully copied to $target_dir"
    else
        echo "Error copying to $target_dir"
    fi
    
    echo "---"
done < user.txt
