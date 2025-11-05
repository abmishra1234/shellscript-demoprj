#!/bin/bash
# Main launcher script for the shell script demo project

# Color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

clear
echo -e "${BLUE}======================================"
echo "  SHELL SCRIPT DEMO PROJECT LAUNCHER  "
echo -e "======================================${NC}"
echo ""
echo "Available demo scripts:"
echo ""
echo -e "${GREEN}1.${NC} Hello World        - Basic shell script introduction"
echo -e "${GREEN}2.${NC} System Info        - Display system information"
echo -e "${GREEN}3.${NC} File Operations    - File manipulation demos"
echo -e "${GREEN}4.${NC} Text Processing    - Text manipulation examples"
echo -e "${GREEN}5.${NC} Calculator         - Simple calculator"
echo -e "${GREEN}6.${NC} Interactive Menu   - Menu-driven interface demo"
echo -e "${GREEN}7.${NC} Run All (non-interactive) - Run all non-interactive scripts"
echo -e "${GREEN}0.${NC} Exit"
echo ""
echo -e "${YELLOW}======================================${NC}"
read -p "Enter your choice [0-7]: " choice
echo ""

case $choice in
    1)
        "$SCRIPT_DIR/scripts/hello_world.sh"
        ;;
    2)
        "$SCRIPT_DIR/scripts/system_info.sh"
        ;;
    3)
        "$SCRIPT_DIR/scripts/file_operations.sh"
        ;;
    4)
        "$SCRIPT_DIR/scripts/text_processing.sh"
        ;;
    5)
        "$SCRIPT_DIR/scripts/calculator.sh"
        ;;
    6)
        "$SCRIPT_DIR/scripts/menu_demo.sh"
        ;;
    7)
        echo -e "${BLUE}Running all non-interactive demos...${NC}"
        echo ""
        echo -e "${GREEN}--- 1. Hello World ---${NC}"
        "$SCRIPT_DIR/scripts/hello_world.sh"
        echo ""
        echo -e "${GREEN}--- 2. System Info ---${NC}"
        "$SCRIPT_DIR/scripts/system_info.sh"
        echo ""
        echo -e "${GREEN}--- 3. File Operations ---${NC}"
        "$SCRIPT_DIR/scripts/file_operations.sh"
        echo ""
        echo -e "${GREEN}--- 4. Text Processing ---${NC}"
        "$SCRIPT_DIR/scripts/text_processing.sh"
        echo ""
        echo -e "${BLUE}All demos completed!${NC}"
        ;;
    0)
        echo -e "${GREEN}Goodbye!${NC}"
        exit 0
        ;;
    *)
        echo -e "${YELLOW}Invalid option. Please run the script again.${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${BLUE}======================================"
echo "Demo completed. Thank you!"
echo -e "======================================${NC}"
