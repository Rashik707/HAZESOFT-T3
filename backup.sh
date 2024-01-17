#!/bin/bash

# Using if condition to check if a directory path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory-to-backup>"
    exit 1
fi

# Set input and backup directories
source_directory="$1"
backup_directory="/path/to/backup/directory"

# Create a timestamp for the backup filename
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_filename="backup_${timestamp}.tar.gz"

# Creating compressed tar archive and check if the backup is successful or not
tar czf "${backup_directory}/${backup_filename}" -C "$(dirname "${source_directory}")" "$(basename "${source_directory}")"
if [ $? -eq 0 ]; then
    echo "Backup successful. Archive saved as ${backup_filename} in ${backup_directory}."
else
    echo "Backup failed."
fi
