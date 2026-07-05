# Azure OpenAI Workshop (Part #1)

## 🚀 GitHub Codespace Ready!

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main)

이 저장소는 자동 환경 설정으로 **GitHub Codespaces**에 완전히 구성되어 있습니다!

### Codespaces 빠른 시작:
1. 위의 "Open in GitHub Codespaces" 배지를 클릭하세요
2. 자동 설정 완료를 기다리세요 (2-3분)
3. Azure OpenAI 자격 증명으로 `.env` 파일을 업데이트하세요
4. 노트북 탐색을 시작하세요!

> **참고**: Codespace 설정 중 문제가 발생하면 [Codespace 가이드](.devcontainer/CODESPACE_GUIDE.md)를 참조하세요.

### 수동 로컬 설정:

#### Linux / macOS / WSL

```bash
# uv 설치
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Alpine Linux인 경우 (Codespaces 등) 빌드 종속성 설치
sudo apk update
sudo apk add build-base linux-headers python3-dev

# 가상환경 생성 및 활성화
uv venv .venv --python 3.12 --seed
source .venv/bin/activate

# 의존성 설치
uv pip install -e .

# Jupyter kernel 등록
python -m ipykernel install --user --name azure-ai-workshop --display-name "Python (.venv)"
```

#### Windows PowerShell

```powershell
# uv 설치
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# 새 터미널을 열거나 PATH 반영 후 버전 확인
uv --version

# 가상환경 생성 및 활성화
uv venv .venv --python 3.12 --seed
.venv\Scripts\Activate.ps1

# 의존성 설치
uv pip install -e .

# Jupyter kernel 등록
python -m ipykernel install --user --name azure-ai-workshop --display-name "Python (.venv)"
```

PowerShell에서 가상환경 활성화가 실행 정책 때문에 막히면 아래 명령을 한 번 실행한 뒤 다시 활성화하세요.

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## 환경설정

```bash
cp .env.sample .env
# Update .env with your Azure OpenAI credentials
```

## 🛠️ Technology Stack

- **Python 3.12+** with uv package manager
- **Azure OpenAI** integration
- **Jupyter Lab/Notebook** environment
- **ML Libraries**: pandas, scikit-learn, matplotlib
- **AI Tools**: OpenAI, tiktoken, tenacity

## Notebook Naming Rule

Top-level notebooks use `NN_snake_case_topic.ipynb`, where `NN` is a unique two-digit sequence number that matches the workshop order. When a new lesson is inserted, renumber the following notebooks so file explorer sorting and lecture order stay aligned.

## Jupyter Notebook 상세 요약

### 01_openai_getting_started.ipynb
OpenAI 모델을 처음 사용하는 사용자를 위한 입문 노트북입니다. 이 노트북에서는 OpenAI 모델의 기본 개념, Azure OpenAI 서비스 설정 방법, API 키 및 엔드포인트 구성, 그리고 간단한 텍스트 생성 예제를 다룹니다. 이를 통해 사용자는 OpenAI 모델을 활용한 기본적인 작업을 시작할 수 있습니다.

### 02_komantle_game.ipynb
OpenAI 임베딩을 활용한 한글 단어 유사도 게임입니다. LLM이 정답 단어를 생성하고, 사용자의 추측 단어와 정답 단어의 임베딩 코사인 유사도를 계산하여 점수를 제공합니다.

### 03_chat_completion_api.ipynb
OpenAI의 Chat Completion API를 활용하여 대화형 AI 애플리케이션을 구축하는 방법을 설명합니다. 이 노트북에서는 시스템 메시지, 사용자 메시지, 어시스턴트 메시지의 역할을 다루며, 다양한 대화 시나리오를 처리하는 방법을 보여줍니다. 고객 지원, 교육 도구, 개인 비서와 같은 실제 응용 사례를 포함합니다.

### 04_responses_api.ipynb
Azure OpenAI Responses API 사용법을 다룹니다. Chat Completions보다 통합된 최신 응답 API 흐름을 실습하며, 상태 관리와 다양한 응답 형식을 다루는 기반을 제공합니다.

### 05_openai_parameters.ipynb
OpenAI 모델의 다양한 매개변수를 상세히 설명합니다. `max_tokens`, `temperature`, `presence_penalty`와 같은 매개변수를 조정하여 모델의 응답 길이, 창의성, 반복성 등을 제어하는 방법을 다룹니다. 각 매개변수의 효과를 실험적으로 확인할 수 있는 코드 예제도 포함되어 있습니다.

### 06_prompt_engineering_best_practices.ipynb
프롬프트 엔지니어링 Best Practices를 다룹니다. 효과적인 프롬프트 작성 방법, 구조화된 출력 생성, 명확한 지침 제공, 원하는 출력 형식 지정 등 다양한 전략을 소개합니다. 이를 통해 사용자는 OpenAI 모델의 성능을 극대화할 수 있습니다.

### 07_prompt_engineering.ipynb
고급 프롬프트 엔지니어링 기술을 다룹니다. Few-shot 학습, Zero-shot 학습, 입력 텍스트 분할, 그리고 복잡한 작업을 처리하기 위한 프롬프트 설계 방법을 설명합니다. 이 노트북은 다양한 예제를 통해 프롬프트 설계의 중요성을 강조합니다.

### 08_movie_classification_unsupervised_incl_recommendations_solution.ipynb
영화 데이터를 기반으로 비지도 학습을 활용한 영화 분류 및 추천 시스템을 구축하는 과정을 다룹니다. 이 노트북에서는 영화 설명을 임베딩으로 변환하고, k-means 클러스터링을 사용하여 유사한 영화 그룹을 식별합니다. 또한, 각 클러스터의 주제를 분석하고 추천 시스템을 구현하는 방법을 보여줍니다.

### 09_llm_rag_demo.ipynb
GPT-4 모델을 활용한 검색 강화 생성(RAG) 기술을 시연합니다. 이 노트북에서는 자연어 질문을 분석하고, 외부 지식 기반에서 관련 정보를 검색한 후, 이를 바탕으로 응답을 생성하는 과정을 보여줍니다. 검색 API와 GPT-4의 통합 사용 사례를 다룹니다.

### 10_function_calling.ipynb
OpenAI의 함수 호출 기능을 활용하여 외부 API와 통합하는 방법을 설명합니다. 이 노트북에서는 함수 정의, 모델과의 통합, 동적 작업 수행, 그리고 API 호출 결과를 처리하는 방법을 다룹니다. 이를 통해 AI와 외부 시스템 간의 상호작용을 구현할 수 있습니다.

### 11_vision.ipynb
GPT-4의 비전 기능을 활용하여 이미지 처리 및 분석 작업을 수행하는 방법을 다룹니다. 이 노트북에서는 이미지를 입력으로 받아 텍스트 설명을 생성하거나, 이미지의 내용을 분석하는 과정을 보여줍니다. 다양한 이미지 기반 응용 사례를 포함합니다.

## Advanced 노트북

### advanced/nl2nosql.ipynb
자연어 질문을 MongoDB 쿼리로 변환하는 NL2NoSQL 시스템을 구현합니다. Docker로 MongoDB를 실행하고, 삼성전자 제품 데이터(스펙 정보 배열 포함)를 저장한 후, Azure OpenAI를 활용하여 "15인치 화면보다 작은 랩탑을 찾아줘"와 같은 자연어 질문을 MongoDB 필터 쿼리로 변환하여 실행합니다. NoSQL 데이터베이스와 AI의 통합 사례를 보여줍니다.

## Reference
- [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/)
- [OpenAI API Reference](https://platform.openai.com/docs/api-reference)
- [azure-openai-samples](https://github.com/Azure/azure-openai-samples)