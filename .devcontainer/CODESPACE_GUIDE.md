# Codespace Setup Guide

## 🚀 Initial Setup (Automatic)

Codespace가 시작되면 자동으로 다음 작업들이 수행됩니다:
1. uv 패키지 매니저 설치
2. Python 3.12 가상환경 생성 (`.venv`)
3. 의존성 패키지 자동 설치
4. Jupyter kernel 등록

## 📋 Manual Setup (필요시)

만약 자동 설정이 실패한 경우, 아래 명령어를 순서대로 실행하세요:

```bash
# 1. uv 설치 (이미 설치되어 있을 수 있음)
curl -LsSf https://astral.sh/uv/install.sh | sh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 2. 버전 확인
uv --version

# 3. 가상환경 생성 및 활성화
uv venv .venv --python 3.12 --seed
source .venv/bin/activate

# 4. 의존성 설치
uv pip install -e .

# 5. Jupyter kernel 등록
python -m ipykernel install --user --name azure-ai-workshop --display-name "Python (.venv)"
```

## 🔧 일상적인 명령어

```bash
# 가상환경 활성화
source .venv/bin/activate

# Python 버전 확인
python --version

# 패키지 설치 (추가로 필요한 경우)
uv pip install package-name

# Jupyter Lab 시작 (필요시)
jupyter lab --no-browser --port=8888

# 코드 포맷팅
black .

# 코드 린트
ruff check .
```

## Environment Variables Template:

```bash
# Copy this to .env and fill in your values
AZURE_OPENAI_ENDPOINT=https://your-resource.openai.azure.com/
AZURE_OPENAI_KEY=your-api-key-here
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4
EMBEDDING_MODEL_NAME=text-embedding-ada-002
SERP_API_KEY=your-serp-api-key-here
```

## Troubleshooting in Codespaces:

1. **Python not found**: Make sure the virtual environment is activated
2. **Jupyter not starting**: Try `jupyter lab --allow-root`
3. **Missing packages**: Run `uv pip install -e .`
4. **Azure connection issues**: Check your `.env` file

## Development Tips:

- Use the integrated terminal for all commands
- Jupyter notebooks will open in VS Code
- Extensions are pre-installed and configured
- Git is pre-configured with basic settings
