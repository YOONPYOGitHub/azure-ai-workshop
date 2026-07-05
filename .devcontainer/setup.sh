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
        apt-transport-https \
        ca-certificates \
        gnupg \
        lsb-release
fi

# Install uv (Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Install Azure CLI
if ! command -v az >/dev/null 2>&1; then
    echo "☁️  Installing Azure CLI..."
    if ! curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash; then
        echo "⚠️  Azure CLI installation failed; continuing because it is optional for notebooks 01-07."
    fi
else
    echo "☁️  Azure CLI already installed."
fi

# Node.js is installed by the devcontainer feature in devcontainer.json.
if command -v node >/dev/null 2>&1; then
    echo "🟢 Node.js already installed: $(node --version)"
fi

echo "✅ Setup completed!"
