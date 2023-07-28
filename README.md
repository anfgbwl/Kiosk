# nbcamp-Project-MovieKiosk
내일배움캠프 Swift 영화관 키오스크
<br><br><br><br>

## 🧑🏻‍💻 프로젝트 소개
"영화 예매 키오스크" 프로그램<p>
이 프로젝트는 Swift 언어를 사용하여 Xcode에서 개발한 Command-Line Tool 애플리케이션입니다. <br>
사용자들은 콘솔창을 통해서 영화 목록을 확인하고 원하는 영화를 선택하여 예매할 수 있습니다. 


<br><br>

## 🛠️ 사용한 기술 스택 (Tech Stack)
<img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">

<br><br>

## 🗓️ 개발 기간
* 2023-07-24(월) ~ 2023-07-28(금), 5일간

<br><br>

## 👫🏻 팀원 구성
<table>
  <tbody>
      <td align="center"><a href="https://github.com/anfgbwl"><img src="width="100px;" alt=""/><br /><sub><b>팀장 : 김서온</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/JayBadass"><img src="" width="100px;" alt=""/><br /><sub><b>팀원 : 이종범</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/LeeJaeheee"><img src="" width="100px;" alt=""/><br /><sub><b>팀원 : 이재희</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/Heasoobean"><img src="" width="100px;" alt=""/><br /><sub><b>팀원 : 허수빈</b></sub></a><br /></td>
  </tbody>
</table>


<br><br>

## 📌 주요 기능
#### 메인화면
- 입력값 검증
- 현장구매, 예매내역 조회
- 0번 입력 시 프로그램 종료
#### 영화예매
- 영화 선택
- 상영 시간 선택
- 예매 인수 및 좌석 선택
- 결제 시 예매자 정보 생성
- 예매자 잔고에 따른 결제 가능여부 검토
- 예매 완료
#### 예매내역 조회
- 예매자 정보 확인
- 티켓 관리(출력 및 취소)

<br>

## 💡 추가 기능
#### 멀티스레드 활용
- Dispatch Queue를 활용하여 특정 동작 수행 후 3초 후에 메인 메뉴로 자동으로 돌아가는 기능 추가
- Timer를 활용하여 멀티스레드를 구현하여 프로그램이 계속 동작하는 동안 20초마다 메시지를 출력

<br><br>

## 🧐 프로젝트 실행 및 사용 방법(선택)

<br><br>

## 🚀 역할 분담
* (팀장) 김서온 - 프로그램 기획 및 요구사항 정리, 예매인수/좌석 선택, 유효성 검사, GCD 멀티스레드
* (팀원) 이종범 - 예매내역 조회 및 티켓 관리, 유효성 검사, 추가 기능 검토
* (팀원) 이재희 - 클래스 상속 구조 설계, 프로그램 뼈대 코드 및 기본 기능 구현, 유효성 검사, 회원 관리 기능, 타이머 스케줄링
* (팀원) 허수빈 - 영화/상영시간 선택, 결제 시간 제한 기능, 유효성 검사, Dispatch Queue

<br><br>

## 문제점와 해결 과정
- 이따 추가할게요!!!
  * 사용자 경험을 고려하여 메뉴 선택 시 입력 오류를 최소화하기 위해 유효성 검사를 추가했습니다.
  * 향후 추가하고 싶은 기능은 무엇 ~~(추가 기능 : 관리자 페이지(상영작 추가/삭제 및 시간 변경), 날짜 선택)
