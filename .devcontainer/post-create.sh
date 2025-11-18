#!/bin/bash
set -e

echo "🔧 Post-create setup for Azure AI Workshop..."

# Ensure uv is in PATH
export PATH="$HOME/.local/bin:$PATH"

# Add to bashrc if not already there
if ! grep -q '.local/bin' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Create virtual environment with Python 3.12
echo "📦 Creating Python virtual environment..."
uv venv .venv --python 3.12 --seed

# Activate virtual environment
source .venv/bin/activate

# Install dependencies from pyproject.toml
echo "📚 Installing Python dependencies..."
uv pip install -e .

# Install Jupyter kernel
echo "🔧 Installing Jupyter kernel..."
python -m ipykernel install --user --name azure-ai-workshop --display-name "Python (.venv)"

# Install additional development dependencies
echo "🛠️  Installing development tools..."
uv pip install \
    black \
    ruff \
    pytest \
    jupyter \
    jupyterlab \
    notebook \
    ipywidgets \
    nbconvert

# Copy environment sample file
if [ -f ".env.sample" ] && [ ! -f ".env" ]; then
    echo "🔧 Creating .env file from sample..."
    cp .env.sample .env
    echo "⚠️  Please update .env with your Azure OpenAI credentials"
fi

# Set up git configuration (if not already set)
if [ -z "$(git config --global user.name)" ]; then
    echo "🔧 Setting up git configuration..."
    git config --global user.name "Codespace User"
    git config --global user.email "user@example.com"
fi

# Create workspace settings for VS Code
mkdir -p .vscode
cat > .vscode/settings.json << EOF
{
    "python.defaultInterpreterPath": "\${workspaceFolder}/.venv/bin/python",
    "python.terminal.activateEnvironment": true,
    "jupyter.kernels.filter": [
        {
            "path": "\${workspaceFolder}/.venv/bin/python",
            "type": "pythonEnvironment"
        }
    ],
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.ruffEnabled": true,
    "files.associations": {
        "*.ipynb": "jupyter-notebook"
    }
}
EOF

# Create launch configuration for debugging
cat > .vscode/launch.json << EOF
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "\${file}",
            "console": "integratedTerminal",
            "cwd": "\${workspaceFolder}",
            "env": {
                "PYTHONPATH": "\${workspaceFolder}"
            }
        },
        {
            "name": "Python: Main Module",
            "type": "python",
            "request": "launch",
            "module": "main",
            "console": "integratedTerminal",
            "cwd": "\${workspaceFolder}"
        }
    ]
}
EOF

echo "🎉 Post-create setup completed!"
echo ""
echo "🔥 Quick start commands:"
echo "  - source .venv/bin/activate  # Activate virtual environment"
echo "  - jupyter lab                # Start Jupyter Lab"
echo "  - python main.py             # Run main application"
echo ""
echo "📝 Don't forget to:"
echo "  1. Update .env with your Azure OpenAI credentials"
echo "  2. Test the environment with one of the notebooks"
echo ""
