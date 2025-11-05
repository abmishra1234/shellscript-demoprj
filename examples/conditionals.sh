#!/bin/bash
# conditionals.sh - Demonstrates if-else statements and comparisons

echo "=== Conditional Statements Demo ==="

# Numeric comparison
NUMBER=10
if [ $NUMBER -gt 5 ]; then
    echo "$NUMBER is greater than 5"
else
    echo "$NUMBER is not greater than 5"
fi

# String comparison
NAME="bash"
if [ "$NAME" = "bash" ]; then
    echo "You are using bash shell"
fi

# File existence check
if [ -f "hello_world.sh" ]; then
    echo "hello_world.sh exists"
else
    echo "hello_world.sh does not exist"
fi

# User input with validation
read -p "Enter a number (1-10): " INPUT
# Check if input is numeric
if ! [[ "$INPUT" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
elif [ "$INPUT" -ge 1 ] && [ "$INPUT" -le 10 ]; then
    echo "Valid input: $INPUT"
else
    echo "Invalid input. Please enter a number between 1 and 10."
fi
