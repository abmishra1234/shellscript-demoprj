# Shell Script Demo Project

A collection of educational shell scripts demonstrating common shell scripting concepts and patterns. This project is designed to help beginners learn shell scripting through practical examples.

## 📁 Project Structure

```
shellscript-demoprj/
├── README.md
├── run_demos.sh           # Interactive launcher for all demo scripts
└── scripts/
    ├── hello_world.sh      # Basic shell script introduction
    ├── system_info.sh      # System information display
    ├── file_operations.sh  # File manipulation demos
    ├── menu_demo.sh        # Interactive menu system
    ├── text_processing.sh  # Text manipulation examples
    └── calculator.sh       # Simple calculator with interactive mode
```

## 🚀 Getting Started

### Prerequisites

- Bash shell (version 4.0 or higher)
- Basic Unix/Linux commands
- Optional: `bc` for calculator script (will fallback to basic arithmetic if not available)

### Running the Scripts

#### Quick Start with Launcher

The easiest way to explore all demos is to use the interactive launcher:

```bash
./run_demos.sh
```

This will present a menu where you can:
- Run individual demo scripts
- Run all non-interactive demos at once
- Exit the launcher

#### Running Individual Scripts

All scripts are executable. You can run them from the scripts directory:

```bash
cd scripts
./hello_world.sh
./system_info.sh
./file_operations.sh
./text_processing.sh
./calculator.sh
./menu_demo.sh
```

Or run them from the root directory:

```bash
bash scripts/hello_world.sh
bash scripts/system_info.sh
# ... and so on
```

## 📚 Script Descriptions

### 1. hello_world.sh
A simple introduction script that demonstrates:
- Basic echo statements
- Command substitution with `$()`
- System variables (whoami, pwd, date)

### 2. system_info.sh
Displays comprehensive system information including:
- Hostname and OS details
- Kernel version
- System uptime
- CPU information
- Memory usage
- Disk usage

### 3. file_operations.sh
Demonstrates file manipulation with functions for:
- Creating timestamped backups
- Counting lines in files
- Finding files by extension
- Using color codes in output

### 4. menu_demo.sh
Interactive menu-driven script showcasing:
- User input handling
- Case statements
- Loop control (while, break)
- Function definitions
- Clear screen and formatting

### 5. text_processing.sh
Text manipulation examples including:
- Case conversion (uppercase/lowercase)
- Word counting
- Text reversal
- String operations (length, substring, replacement)

### 6. calculator.sh
Simple calculator demonstrating:
- Arithmetic operations
- Function definitions
- Conditional logic
- Interactive user input
- Error handling (division by zero)

## 💡 Learning Concepts

This project covers essential shell scripting concepts:

- **Variables and Command Substitution**: Using `$()` and variable assignment
- **Functions**: Defining and calling reusable functions
- **Conditionals**: if-then-else statements and case statements
- **Loops**: while loops and menu systems
- **User Input**: Reading input with `read` command
- **File Operations**: Working with files and directories
- **Text Processing**: String manipulation and text utilities
- **Color Output**: Using ANSI color codes
- **Error Handling**: Checking for errors and edge cases

## 🎯 Usage Examples

### Run System Information
```bash
./scripts/system_info.sh
```

### Interactive Calculator
```bash
./scripts/calculator.sh
# Follow the prompts to perform calculations
```

### Interactive Menu
```bash
./scripts/menu_demo.sh
# Navigate through menu options
```

## 🛠️ Customization

Feel free to modify and extend these scripts for your learning:

1. Add new functions to existing scripts
2. Combine concepts from multiple scripts
3. Create your own scripts using these as templates
4. Experiment with different parameters and options

## 📝 Best Practices Demonstrated

- Proper shebang (`#!/bin/bash`)
- Comments explaining functionality
- Function-based organization
- Error handling and validation
- User-friendly output formatting
- Graceful degradation (e.g., calculator without bc)

## 🤝 Contributing

This is a learning project. Feel free to:
- Add new example scripts
- Improve existing scripts
- Fix bugs or add error handling
- Enhance documentation

## 📄 License

This project is open source and available for educational purposes.

## 🎓 Next Steps

After exploring these scripts, try:
1. Creating your own utility scripts
2. Combining multiple concepts
3. Adding logging functionality
4. Implementing more complex error handling
5. Working with external files and data processing

---

**Happy Shell Scripting! 🐚**
