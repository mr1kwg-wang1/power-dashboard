# power-dashboard 프로젝트

## 프로젝트 개요
성신양회 단양공장 비상계획관/시설보안팀 담당자가 관리하는 
전력 사용량 대시보드. GitHub Pages로 배포됨.

## 업무 배경
- 담당 업무: 비상계획관 + 시설보안 (차량출입통제, 방문자관리, 보안문서, 
  생산계획팀 문서 지원)
- 보안정책상 회사 시스템에 자동 연동 불가 → 수동 월간 업데이트(B방식) 채택

## 핵심 파일
- parse_power_report.py: "전력월보", "전력요금계산서" 시트에서 
  openpyxl(data_only=True)로 데이터 파싱
- data.json: 파싱 결과 저장, 변경 시 GitHub Actions가 Telegram 알림 트리거
- Telegram 봇: @wanggi_dashboard_bot (Chat ID: 8500699667)

## 주의사항
- GitHub Actions YAML 들여쓰기 오류로 cron 트리거 실패 이력 있음
  → 반드시 git config core.autocrlf false 설정 확인
- 공정별 그룹: R/M, COM, K/L, C/M (kWh/t 단위 비교)

## 하지 말아야 할 것
- 회사 내부 시스템에 직접 API 연동 시도 금지 (보안정책)
- 원본 엑셀 셀 좌표 임의 변경 금지 (parse_power_report.py와 매핑됨)
