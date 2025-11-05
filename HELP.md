# Shell Scripting Help & Resources

## Quick Reference

### Shebang
Always start your shell scripts with a shebang line:
```bash
#!/bin/bash
```

### Making Scripts Executable
```bash
chmod +x script.sh
```

### Running Scripts
```bash
./script.sh          # Run from current directory
bash script.sh       # Run with bash explicitly
```

## Common Shell Scripting Concepts

### Variables
```bash
# Define a variable
NAME="John"

# Use a variable
echo "Hello, $NAME"
echo "Hello, ${NAME}"
```

### User Input
```bash
read -p "Enter your name: " username
echo "Hello, $username"
```

### Conditionals
```bash
if [ condition ]; then
    # commands
elif [ another_condition ]; then
    # commands
else
    # commands
fi
```

### Loops
```bash
# For loop
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# While loop
counter=0
while [ $counter -lt 5 ]; do
    echo "Counter: $counter"
    ((counter++))
done
```

### Functions
```bash
function greet() {
    echo "Hello, $1"
}

greet "World"
```

## Best Practices

1. **Use meaningful variable names** - Make your code self-documenting
2. **Add comments** - Explain complex logic
3. **Check for errors** - Use `set -e` to exit on errors
4. **Quote variables** - Use `"$variable"` to handle spaces
5. **Use shellcheck** - Static analysis tool for shell scripts

## Useful Commands

- `man bash` - Bash manual
- `help command` - Help for built-in commands
- `shellcheck script.sh` - Check script for common errors

## Learning Resources

### Online Resources
- [Bash Guide for Beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/)
- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
- [ShellCheck](https://www.shellcheck.net/) - Online shell script analyzer

### Practice Sites
- [HackerRank Shell](https://www.hackerrank.com/domains/shell)
- [Exercism Bash Track](https://exercism.org/tracks/bash)

## Common Pitfalls to Avoid

1. Not quoting variables properly
2. Forgetting to make scripts executable
3. Using `==` instead of `=` in `[ ]` tests
4. Not checking if files exist before operations
5. Hardcoding paths instead of using relative paths

## Getting Help

- Stack Overflow: Tag your questions with `bash` and `shell`
- Reddit: r/bash, r/commandline
- IRC: #bash on freenode

## Contributing to This Project

If you have useful examples or tips, feel free to add them to this repository!
