#!/bin/bash
# Interactive Menu Script - Demonstrates user input handling

# Function to display menu
show_menu() {
    clear
    echo "======================================"
    echo "        MAIN MENU                     "
    echo "======================================"
    echo ""
    echo "1. Display Date and Time"
    echo "2. Show Current Directory"
    echo "3. List Files"
    echo "4. Show Disk Usage"
    echo "5. Exit"
    echo ""
    echo "======================================"
}

# Function to display date and time
show_datetime() {
    echo ""
    echo "Current Date and Time:"
    date
    echo ""
    read -p "Press Enter to continue..."
}

# Function to show current directory
show_pwd() {
    echo ""
    echo "Current Directory:"
    pwd
    echo ""
    read -p "Press Enter to continue..."
}

# Function to list files
list_files() {
    echo ""
    echo "Files in current directory:"
    ls -lh
    echo ""
    read -p "Press Enter to continue..."
}

# Function to show disk usage
show_disk() {
    echo ""
    echo "Disk Usage:"
    df -h
    echo ""
    read -p "Press Enter to continue..."
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice [1-5]: " choice
    
    case $choice in
        1)
            show_datetime
            ;;
        2)
            show_pwd
            ;;
        3)
            list_files
            ;;
        4)
            show_disk
            ;;
        5)
            echo ""
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo ""
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done
