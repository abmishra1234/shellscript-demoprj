#!/bin/bash
# system_info.sh - Display system information

echo "======================================"
echo "       System Information"
echo "======================================"
echo ""

# Hostname
echo "Hostname: $(hostname)"

# Operating System
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: $NAME $VERSION"
fi

# Kernel version
echo "Kernel: $(uname -r)"

# Uptime
echo "Uptime: $(uptime -p 2>/dev/null || uptime)"

# Current user
echo "Current User: $(whoami)"

# Current directory
echo "Current Directory: $(pwd)"

# Disk usage
echo ""
echo "Disk Usage:"
df -h / 2>/dev/null | grep -v Filesystem || echo "Unable to retrieve disk usage"

# Memory usage
echo ""
echo "Memory Usage:"
free -h 2>/dev/null || echo "Unable to retrieve memory usage"

echo ""
echo "======================================"
