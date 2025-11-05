#!/bin/bash
# Simple Calculator Script - Demonstrates arithmetic operations

echo "======================================"
echo "    SIMPLE CALCULATOR                 "
echo "======================================"
echo ""

# Function to add
add() {
    echo "scale=2; $1 + $2" | bc
}

# Function to subtract
subtract() {
    echo "scale=2; $1 - $2" | bc
}

# Function to multiply
multiply() {
    echo "scale=2; $1 * $2" | bc
}

# Function to divide
divide() {
    if [ "$2" == "0" ]; then
        echo "Error: Division by zero"
        return 1
    fi
    echo "scale=2; $1 / $2" | bc
}

# Check if bc is available, if not use basic arithmetic
if ! command -v bc &> /dev/null; then
    echo "Note: 'bc' not found, using basic arithmetic (integers only)"
    
    add() { echo $(($1 + $2)); }
    subtract() { echo $(($1 - $2)); }
    multiply() { echo $(($1 * $2)); }
    divide() {
        if [ "$2" == "0" ]; then
            echo "Error: Division by zero"
            return 1
        fi
        echo $(($1 / $2))
    }
fi

# Demo calculations
NUM1=10
NUM2=5

echo "Number 1: $NUM1"
echo "Number 2: $NUM2"
echo ""
echo "Operations:"
echo "  $NUM1 + $NUM2 = $(add $NUM1 $NUM2)"
echo "  $NUM1 - $NUM2 = $(subtract $NUM1 $NUM2)"
echo "  $NUM1 * $NUM2 = $(multiply $NUM1 $NUM2)"
echo "  $NUM1 / $NUM2 = $(divide $NUM1 $NUM2)"
echo ""

# Interactive mode
read -p "Do you want to perform a calculation? (y/n): " answer
if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
    read -p "Enter first number: " n1
    read -p "Enter second number: " n2
    read -p "Enter operation (+, -, *, /): " op
    
    case $op in
        +)
            result=$(add $n1 $n2)
            ;;
        -)
            result=$(subtract $n1 $n2)
            ;;
        \*)
            result=$(multiply $n1 $n2)
            ;;
        /)
            result=$(divide $n1 $n2)
            ;;
        *)
            echo "Invalid operation"
            exit 1
            ;;
    esac
    
    echo ""
    echo "Result: $n1 $op $n2 = $result"
fi

echo ""
echo "======================================"
