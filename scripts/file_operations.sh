#!/bin/bash
# File Operations Script - Demonstrates file manipulation

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "======================================"
echo "    FILE OPERATIONS DEMO              "
echo "======================================"
echo ""

# Function to create a backup
backup_file() {
    local file=$1
    if [ -f "$file" ]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$file" "$backup"
        echo -e "${GREEN}✓${NC} Backup created: $backup"
    else
        echo -e "${RED}✗${NC} File not found: $file"
        return 1
    fi
}

# Function to count lines in a file
count_lines() {
    local file=$1
    if [ -f "$file" ]; then
        local lines=$(wc -l < "$file")
        echo -e "${GREEN}✓${NC} File '$file' has $lines lines"
    else
        echo -e "${RED}✗${NC} File not found: $file"
        return 1
    fi
}

# Function to find files by extension
find_files_by_extension() {
    local extension=$1
    local directory=${2:-.}
    echo -e "${YELLOW}Searching for *.$extension files in $directory${NC}"
    find "$directory" -type f -name "*.$extension" 2>/dev/null
}

# Demo usage
echo "Demo: Available file operation functions"
echo ""
echo "1. backup_file <filename>       - Create a timestamped backup"
echo "2. count_lines <filename>       - Count lines in a file"
echo "3. find_files_by_extension <ext> [dir] - Find files by extension"
echo ""

# Example demonstration
if [ -f "$0" ]; then
    echo "Example: Counting lines in this script:"
    count_lines "$0"
fi

echo ""
echo "======================================"
