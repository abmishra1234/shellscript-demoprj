#!/bin/bash
# System Information Script - Displays system details

echo "======================================"
echo "      SYSTEM INFORMATION              "
echo "======================================"
echo ""

# Hostname
echo "Hostname: $(hostname)"

# OS Information
if [ -f /etc/os-release ]; then
    echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
fi

# Kernel Version
echo "Kernel: $(uname -r)"

# Uptime
echo "Uptime: $(uptime -p 2>/dev/null || uptime)"

# CPU Info
echo ""
echo "CPU Information:"
if [ -f /proc/cpuinfo ]; then
    echo "  Model: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d':' -f2 | xargs)"
    echo "  Cores: $(grep -c processor /proc/cpuinfo)"
fi

# Memory Info
echo ""
echo "Memory Information:"
if command -v free &> /dev/null; then
    free -h | head -2
fi

# Disk Usage
echo ""
echo "Disk Usage:"
df -h / 2>/dev/null | tail -1

echo ""
echo "======================================"
