#!/bin/bash
# Text Processing Script - Demonstrates text manipulation

echo "======================================"
echo "    TEXT PROCESSING DEMO              "
echo "======================================"
echo ""

# Function to convert text to uppercase
to_upper() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

# Function to convert text to lowercase
to_lower() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# Function to count words
count_words() {
    echo "$1" | wc -w
}

# Function to reverse text
reverse_text() {
    echo "$1" | rev
}

# Function to remove spaces
remove_spaces() {
    echo "$1" | tr -d ' '
}

# Demo text
TEXT="Hello World from Shell Scripting"

echo "Original text: $TEXT"
echo ""
echo "Processing examples:"
echo "  Uppercase:     $(to_upper "$TEXT")"
echo "  Lowercase:     $(to_lower "$TEXT")"
echo "  Word count:    $(count_words "$TEXT")"
echo "  Reversed:      $(reverse_text "$TEXT")"
echo "  No spaces:     $(remove_spaces "$TEXT")"
echo ""

# String manipulation examples
echo "String manipulation:"
STRING="shellscript-demoprj"
echo "  Original: $STRING"
echo "  Length: ${#STRING}"
echo "  First 5 chars: ${STRING:0:5}"
echo "  Replace '-' with '_': ${STRING//-/_}"
echo ""

echo "======================================"
