# 단양공장 전력사용량 대시보드 (초안)

## 구성
- `index.html` — GitHub Pages로 열리는 대시보드 화면
- `data.json` — 월별 누적 데이터 (자동/수동 갱신 대상)
- `parse_power_report.py` — 전력월보 엑셀 파일 → data.json 변환 스크립트
- `monthly_update.bat` — Windows용 원클릭 갱신 스크립트

## 최초 설정 (1회만)
1. GitHub 저장소 생성 (예: `power-dashboard`), 이 4개 파일 업로드
2. 저장소 Settings → Pages → Source를 `main` 브랜치로 설정 → Pages URL 생성됨
3. 사내 PC에 이 저장소를 `git clone` 해두기 (예: `C:\Users\본인이름\Documents\power-dashboard`)
4. `monthly_update.bat` 파일 안의 `REPO_PATH`를 본인 clone 경로로 수정

## 매월 할 일 (약 30초)
1. 사내망 드라이브에서 새 `전력월보_YYYY-MM.xlsx` 파일 준비
2. `monthly_update.bat` 를 실행하고, 파일 경로를 인자로 넘기거나 프롬프트에 입력
   (또는 탐색기에서 xlsx 파일을 monthly_update.bat 위로 드래그&드롭)
3. 자동으로 data.json이 갱신되고 GitHub에 push됨 → 대시보드에 자동 반영

## 파일 구조 전제
- 파일명: `전력월보_YYYY-MM.xlsx` (연-월을 파일명에서 추출함)
- 시트명: `전력월보`, `전력요금계산서` (2026-06 원본 기준)
- 셀 좌표가 매월 동일해야 함 — 만약 향후 양식이 바뀌면
  `parse_power_report.py` 상단의 `COORDS` / `RATE_COORDS` 만 수정하면 됨

## 한계 / 주의사항
- 3~5월 데이터는 스크린샷 이미지 판독 기반 **추정치**입니다 (표에 "추정" 배지 표시).
  해당 월 원본 xlsx가 있으면 같은 방식으로 다시 파싱해서 정확도를 높일 수 있습니다.
- 사내망 드라이브는 GitHub Actions가 직접 접근할 수 없어 완전 자동화는 아니며,
  매월 1회 스크립트 실행이 필요한 "반자동" 구조입니다.
- 목표 원단위, 예산 대비 실적 등 기준선 데이터는 아직 없어 절대평가는 불가합니다.
