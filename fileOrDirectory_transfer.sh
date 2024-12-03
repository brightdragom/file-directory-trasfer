#!/bin/bash

# 파일 또는 디렉토리 경로 입력
read -p "전송할 파일 또는 디렉토리의 경로를 입력하세요: " INPUT_PATH

# 입력한 경로를 절대경로로 변환
ABS_PATH=$(realpath "$INPUT_PATH" 2>/dev/null)

# 경로 존재 여부 확인
if [[ ! -e "$ABS_PATH" ]]; then
    echo "파일 또는 디렉토리가 존재하지 않습니다: $INPUT_PATH"
    exit 1
fi

# 서버 정보 입력
read -p "서버 주소를 입력하세요 (예: user@hostname): " SERVER
read -p "서버에서 저장할 경로를 입력하세요 (예: /path/to/destination/): " DEST_PATH

# 파일 또는 디렉토리 전송
if [[ -d "$ABS_PATH" ]]; then
    echo "디렉토리를 전송 중입니다..."
    scp -r "$ABS_PATH" "$SERVER:$DEST_PATH"
elif [[ -f "$ABS_PATH" ]]; then
    echo "파일을 전송 중입니다..."
    scp "$ABS_PATH" "$SERVER:$DEST_PATH"
else
    echo "유효하지 않은 경로입니다."
    exit 1
fi

# 전송 결과 확인
if [[ $? -eq 0 ]]; then
    echo "전송이 완료되었습니다."
else
    echo "전송 중 오류가 발생했습니다."
    exit 2
fi
