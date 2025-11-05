#!/bin/bash
# backup.sh - Simple backup utility

# Configuration
SOURCE_DIR="${1:-.}"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

echo "Simple Backup Utility"
echo "====================="

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist"
    exit 1
fi

# Create backup
echo "Backing up: $SOURCE_DIR"
echo "Backup location: $BACKUP_DIR/$BACKUP_NAME"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "Backup file: $BACKUP_DIR/$BACKUP_NAME"
    
    # Display backup size
    if command -v du &> /dev/null; then
        SIZE=$(du -h "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)
        echo "Backup size: $SIZE"
    fi
else
    echo "Error: Backup failed"
    exit 1
fi

# List existing backups
echo ""
echo "Existing backups:"
ls -lh "$BACKUP_DIR" 2>/dev/null || echo "No backups found"
