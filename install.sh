#!/usr/bin/env bash
set -euo pipefail

echo "Installing Fidelity Image Cleanup..."
sudo cp cleanup-images.sh /usr/local/bin/
sudo chmod 750 /usr/local/bin/cleanup-images.sh
sudo cp cleanup-images.conf /etc/fidelity/cleanup-images.conf 2>/dev/null || echo "Config install skipped (create /etc/fidelity/ manually if needed)"
echo "Installation complete. Run 'cleanup-images.sh --help' to verify."