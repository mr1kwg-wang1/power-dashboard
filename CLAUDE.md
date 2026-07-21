# CLAUDE.md

## 프로젝트 개요
성신양회 단양공장 전력월보 대시보드. R/M·COM·K/L·C/M 4개 공정별
원단위 추이·사용량 비교·전력단가 추이를 시각화하는 GitHub Pages 사이트.

## 핵심 파일
- parse_power_report.py: 월별 전력월보/전력요금계산서 엑셀을
  openpyxl(data_only=True)로 파싱해 data.json 생성
- data.json: 파싱 결과, 3~6월 등 월별 데이터 누적 저장
- index.html: 공정별 원단위·사용량 비교·전력단가 추이 시각화 대시보드
- monthly_update.bat: 월간 수동 갱신용 배치 스크립트
- .github/workflows/telegram-notify.yml: data.json push 시
  @wanggi_dashboard_bot이 "단양공장전력관리" 텔레그램 그룹으로 알림 발송

## 워크플로우
1. 월별 전력월보/전력요금계산서 엑셀 업로드
2. parse_power_report.py로 파싱 (또는 monthly_update.bat 실행)
3. data.json 갱신 → commit & push
4. GitHub Actions가 대시보드 갱신 + 텔레그램 알림 자동 발송

## 관련 저장소
- daily-power-dashboard (일보용, 별도 저장소): R·Co·K·C 4개 설비군 기준

## 주의사항
- 회사 폐쇄망 SCADA 환경이라 자동 연동 불가 → 월간 수동 업데이트(B방식)
- GitHub Actions YAML 들여쓰기 오류 이력 있음 → git config core.autocrlf false 확인
- 원본 엑셀 셀 좌표 임의 변경 금지 (parse_power_report.py와 매핑됨)
