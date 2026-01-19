#!/bin/bash
set -e

echo "🚀 FastAPI Deploy Script Start"

APP_DIR="/home/ubuntu/workspace/todo-repository"

echo "1. 프로젝트 폴더 이동"
cd $APP_DIR

echo "2. 가상환경 활성화"
source venv/bin/activate

echo "3. 의존성 설치"
pip install -r requirements.txt

echo "4. 기존 uvicorn 종료"
pkill -f "uvicorn main:app" || true

echo "5. FastAPI 서버 백그라운드 실행"
nohup uvicorn main:app --host 0.0.0.0 --port 8000 \
  > uvicorn.log 2>&1 < /dev/null &

echo "✅ Deploy 완료"
