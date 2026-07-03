@echo off
REM ====================================================================
REM  전력월보 대시보드 월간 갱신 스크립트 (Windows)
REM  사용법: 이 파일을 더블클릭하거나, 사내망 xlsx 파일을 인자로 드래그
REM ====================================================================
REM  1) 아래 두 경로를 본인 환경에 맞게 한 번만 수정하세요.
set REPO_PATH=C:\Users\YOUR_NAME\Documents\power-dashboard
set NETWORK_FILE=%1

if "%NETWORK_FILE%"=="" (
  echo 사용법: monthly_update.bat "사내망\전력월보_2026-07.xlsx"
  pause
  exit /b 1
)

cd /d %REPO_PATH%
python parse_power_report.py "%NETWORK_FILE%"

git add data.json
git commit -m "전력월보 데이터 갱신: %NETWORK_FILE%"
git push

echo.
echo 완료! GitHub Pages 대시보드가 1~2분 내 자동 반영됩니다.
pause
