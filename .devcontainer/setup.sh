#!/bin/bash
set -e

echo "🚀 Setting up Azure AI Workshop environment..."

# Detect OS type
if [ -f /etc/alpine-release ]; then
    # Alpine Linux
    echo "📦 Detected Alpine Linux"
    sudo apk update
    sudo apk add build-base linux-headers python3-dev curl git bash
else
    # Debian/Ubuntu
    echo "📦 Detected Debian/Ubuntu"
    sudo apt-get update
    sudo apt-get install -y \
        build-essential \
        curl \
        git \
        jq \
        wget \
        unzip \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        gnupg \
        lsb-release
fi

# Install uv (Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Node.js (for potential web components)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "✅ Setup completed!"
