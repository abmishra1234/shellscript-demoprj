#!/bin/bash
# variables.sh - Demonstrates working with variables

# Define variables
NAME="Shell Script"
VERSION="1.0"
CURRENT_DATE=$(date +%Y-%m-%d)

# Display variables
echo "Script Name: $NAME"
echo "Version: $VERSION"
echo "Current Date: $CURRENT_DATE"

# Get user input
read -p "Enter your name: " USERNAME
echo "Hello, $USERNAME! Nice to meet you."

# Arithmetic operations
NUM1=10
NUM2=5
SUM=$((NUM1 + NUM2))
echo "Sum of $NUM1 and $NUM2 is: $SUM"
