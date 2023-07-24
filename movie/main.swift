print("[5조 영화관]")
print("1. 현장 구매")
print("2. 예매 내역 확인")


print("원하는 메뉴 번호를 입력하세요:", terminator: " ")

if let mainPage = readLine() {
    switch mainPage {
    case "1":
        print(" 1.엘리멘탈 \n 2.바비 \n 3.명탐정코난 \n 4.인시디어스 \n 5.미션임파서블7")
    case "2":
        print("조회하실 휴대폰 번호를 입력해주세요")
    default:
        print("1과 2중에 선택해주세요.")
    }
} else {
    print("입력값이 없습니다.")
}

print("원하시는 영화 번호를 입력하세요:", terminator: " ")


if let movieTime = readLine() {
    switch movieTime {
    case "1":
        print("시간표- 09:30(10,000원), 11:00(18,000원), 12:30(18,000원), 16:40(18,000원), 20:20")
    case "2":
        print("시간표- 11:45(18,000원), 12:30(18,000원), 16:40(18,000원), 20:20(18,000원)")
    case "3":
        print("시간표- 09:30(10,000원) 11:45(18,000원), 12:30(18,000원), 20:20(18,000원), 22:45(10,000원)")
    case "4":
        print("시간표- 12:30(18,000원), 16:40(18,000원), 20:20(18,000원), 22:45(10,000원)")
    case "5":
        print("시간표- 11:00(18,000원), 11:45(18,000원), 16:40(18,000원)")
    default:
        print("1~5중 하나를 선택해주세요.")
    }
}

print("원하는 시간표를 입력하세요 (예: 09:30):", terminator: " ")

if let moviesit = readLine() {
    switch moviesit {
    case "09:30":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "11:00":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "11:45":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "12:30":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "16:40":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "20:00":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    case "22:45":
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    default:
        print("A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3, D4, D5")
    }
}

print("원하는 좌석을 선택하세요 (예: A1):", terminator: " ")

if let movienum = readLine() {
    print("예매자 전화번호를 입력해주세요:", terminator: " ")
    if let phoneNumber = readLine() {
        print("결제하시겠습니까? Y/N")
        if let paymentChoice = readLine() {
            if paymentChoice.uppercased() == "Y" {
                print("결제가 완료되었습니다.")
            } else if paymentChoice.uppercased() == "N" {
                print("결제가 취소되었습니다.")
            } else {
                print("잘못된 입력입니다. Y 또는 N을 입력해주세요.")
            }
        } else {
            print("결제 여부를 입력하지 않았습니다.")
        }
    }
}




