# nbcamp-Project-MovieKiosk
[내일배움캠프 iOS트랙] 3주차 팀 과제(5조) - 영화관 키오스크
<br><br><br><br>

## 🧑🏻‍💻 프로젝트 소개
"영화관 키오스크" 프로그램<p>
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
      <td align="center"><img src="https://github.com/anfgbwl/Kiosk/assets/53863005/b093acc9-050e-4141-a799-e8d845b9180d"width="100px;" alt=""/><br /><sub><a href="https://github.com/anfgbwl"><b>팀장 : 김서온</b></sub></a><br /></td>
      <td align="center"><img src="https://github.com/anfgbwl/Kiosk/assets/53863005/39e5b5aa-747a-477e-8d31-0b8b40679e84" width="100px;" alt=""/><br /><sub><a href="https://github.com/JayBadass"><b>팀원 : 이종범</b></sub></a><br /></td>
      <td align="center"><img src="https://github.com/anfgbwl/Kiosk/assets/53863005/bb7ae90d-1322-4dad-920d-37a736cd857e" width="100px;" alt=""/><br /><sub><a href="https://github.com/LeeJaeheee"><b>팀원 : 이재희</b></sub></a><br /></td>
      <td align="center"><img src="https://github.com/anfgbwl/Kiosk/assets/53863005/66f5a4aa-630d-4a4b-9003-b1bf8db36f99" width="100px;" alt=""/><br /><sub><a href="https://github.com/Heasoobean"><b>팀원 : 허수빈</b></sub></a><br /></td>
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

## 🎬 추가 기능
#### 멀티스레드 활용
- Dispatch Queue를 활용하여 특정 동작 수행 후 3초 후에 메인 메뉴로 자동으로 돌아가는 기능 추가
- Timer를 활용하여 멀티스레드를 구현하여 프로그램이 계속 동작하는 동안 20초마다 메시지를 출력

<br><br>

## 🧐 프로젝트 실행 및 사용 방법
<b>1. 메인화면에서 원하는 기능 선택하기</b><br>
    <img width="363" alt="메인화면" src="https://github.com/anfgbwl/Kiosk/assets/53863005/7598ebc0-7088-4197-b1e7-87345c04328e"><br>

<b>2. 현장 구매 선택 및 예매 차트 선택하기</b><br>
    <img width="363" alt="현장구매" src="https://github.com/anfgbwl/Kiosk/assets/53863005/0e63d51a-6e25-4606-92c8-a7c92a876b5b"><br>
* 영화별 프로모션 진행 시 안내 문구 프린트
  
<b>3. 상영시간 선택하기</b><br>
    <img width="363" alt="상영시간표" src="https://github.com/anfgbwl/Kiosk/assets/53863005/7bdc045c-3fd1-4b06-97d1-bf995dbdfe95"><br>
* 현재 시간을 기준으로 예매가 가능한 상영시간만 표시

<b>4. 예매인수 입력하기</b><br>
    <img width="363" alt="예매인수" src="https://github.com/anfgbwl/Kiosk/assets/53863005/0b8b9b4f-65e2-4913-a65b-8acc0448e316"><br>

<b>5. 좌석 선택하기</b><br>
    <img width="336" alt="좌석배치도" src="https://github.com/anfgbwl/Kiosk/assets/53863005/7203bcff-a0d4-4f30-bdfc-c5952aa649af"><br>
* 예매인수와 동일한 갯수의 좌석 선택
* 문자열 입력값 검증

<b>6. 예매자 정보 입력하기</b><br>
    <img width="336" alt="예매자정보" src="https://github.com/anfgbwl/Kiosk/assets/53863005/9d82bffa-63a4-4dda-91cb-7d4564ed8941"><br>
* 유저 생성
* 예매 시 입력한 휴대폰번호로 예매 내역 조회 가능

<b>7. 결제하기</b><br>
    <img width="336" alt="결제" src="https://github.com/anfgbwl/Kiosk/assets/53863005/fb8e517d-c3d8-410d-bb2d-91a4127232fc"><br>
* 잔고 부족 시 결제 불가능
* 점검시간 결제 불가능 옵션 추가
* 결제 완료 시 잔고 안내 및 3초 후 메인화면으로 이동

<b>8. 예매 내역 조회 선택 및 예매자 정보 확인</b><br>
    <img width="336" alt="예매자정보확인" src="https://github.com/anfgbwl/Kiosk/assets/53863005/fca41805-eb35-458b-87bb-8295c101a63f"><br>
    
<b>9. 예매 조회</b><br>
    <img width="336" alt="예매확인" src="https://github.com/anfgbwl/Kiosk/assets/53863005/5b0a69a2-1e59-4d28-82dd-1ed579aef376"><br>
* 예매내역 없을 시 이전 화면으로 이동

<b>10. 티켓관리</b><br>
    <img width="336" alt="티켓관리" src="https://github.com/anfgbwl/Kiosk/assets/53863005/3f855892-23df-468d-ad90-f3e518e48c1a"><br>
* 티켓 출력 및 예매 취소 가능

<b>11. 티켓출력</b><br>
    <img width="336" alt="티켓출력" src="https://github.com/anfgbwl/Kiosk/assets/53863005/54dcecbf-8b83-4c25-960c-6be38b104aae"><br>
* 티켓 출력 시 3초 후 메인화면으로 이동

<b>12. 예매취소</b><br>
    <img width="336" alt="예매취소" src="https://github.com/anfgbwl/Kiosk/assets/53863005/38afb9e4-3969-4d08-b028-2d1f063a16d2"><br>
* 예매 취소 시 결제금액 환불 및 잔고 안내
    

<br><br>

## 🚀 역할 분담
* (팀장) 김서온 - 프로그램 기획 및 요구사항 정리, 예매인수/좌석 선택, 유효성 검사, GCD 멀티스레드
* (팀원) 이종범 - 예매내역 조회 및 티켓 관리, 유효성 검사, 추가 기능 검토
* (팀원) 이재희 - 클래스 상속 구조 설계, 프로그램 뼈대 코드 및 기본 기능 구현, 유효성 검사, 회원 관리 기능, 타이머 스케줄링
* (팀원) 허수빈 - 영화/상영시간 선택, 결제 시간 제한 기능, 유효성 검사, Dispatch Queue

<br><br>

## 💡 문제점와 해결 방법

1. 클래스 상속 관계 정립의 어려움<br>
 해결 방법 : 튜터님께 피드백받고 영화-상영작 클래스 상속관계 정립, 각기 다른 프로모션 함수를 추가하여 상영작들의 별개 클래스 당위성 입증

2. Dispatch Queue를 활용하여 동작 지연시키는 코드 동작 안함<br>
 해결 방법 : Runloop를 함께 사용해주니 제대로 동작

3. 멀티스레드로 5초마다 빠른 예매 리스트를 보여줘야 하는데 한번만 보여주고 반복문 실행이 안되는 문제 발생<br>
 해결 방법 : Timer를 활용하여 구현
