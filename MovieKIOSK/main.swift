//
//  main.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

var movieList: [Movie] = [Elemental(), Barbie(), Conan(), Insidious()]
var userBalance = [String: Int]()

print("\n5조 영화관에 오신걸 환영합니다")

var choice = "-1"
while choice != "0" {
    print(mainMsg)
    choice = readLine()!
    
    switch choice {
    case "1":
        print("1번 선택: 영화 목록 조회")
    case "2":
        print("2번 선택: 영화 예매")
    case "0":
        print("0번 선택: 프로그램 종료")
    default:
        print(errorLine)
        print("잘못된 입력입니다. 메뉴 번호를 똑바로 보고 다시 입력해주세요.")
    }
    // 유효성 검사(1) : 1,2,0 외 번호 입력 시 오류문 출력 후 재 안내/ 일단 완료
    
    
    switch choice {
    case "1":
    first: while true {
        print(line)
        print("예매 차트\n예매하실 영화의 번호를 입력해주세요")
        movieList.enumerated().forEach({ print("\($0.0+1). \($0.1.title)")})
        print("\n<- : 뒤로 가기")
        var movieIndex: Int?
        repeat {
            if let input = readLine() {
                if input == "<-" { break first }
                if let index = Int(input), index >= 1 && index <= movieList.count {
                    movieIndex = index - 1
                    break
                }
            }
            print(errorLine)
            print("잘못된 입력입니다. 영화 번호를 다시 입력해주세요.")
        } while movieIndex == nil
        let movie = movieList[movieIndex!]
        // 유효성 검사(2) : 1,2,3,4 외 번호 입력 시 오류문 출력 후 재 안내/ 일단 완료
        
        
    second: while true {
        print(line)
        print("예매하실 상영 시간의 번호를 입력해주세요")
        
        // TimeTable 클래스의 인스턴스를 통해 getCurrentTime 함수 호출
        let timeTableInstance = TimeTable("00:00")
        let currentTime = timeTableInstance.getCurrentTime()
        var validTime = 0
        var availableList: [TimeTable] = []
        
        print("현재 시간: \(currentTime)")
        
        for timeTable in movie.timeTable {
            // 현재 시간과 timeTable.time을 비교하여 이후의 시간표만 출력
            if timeTable.time >= currentTime {
                validTime += 1
                availableList.append(timeTable)
                print("\(validTime). \(timeTable.time) \(timeTable.price) \(timeTable.remainedSeat)/12")
            }
        }
        print("\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
                
        var timeIndex: Int?
        while true {
            if let input = readLine(), !input.isEmpty {
                if input == "<-" {
                    break second
                } else if input == "0" {
                    break first
                } else if let inputInt = Int(input), 1...validTime ~= inputInt {
                    timeIndex = movie.timeTable.firstIndex(where: {$0.time == availableList[inputInt-1].time}) //fixed
                    break
                } else {
                    print("예매하실 상영 시간의 번호를 확인해주세요.")
                }
            }
        }
        let time = movie.timeTable[timeIndex!]
        
        
    third: while true {
        print(line)
        var headCount: Int = 0
        while true {
            print("예매하실 인원 수를 입력해주세요. (최대 3인)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
            if let inputHeadCount = readLine() {
                if inputHeadCount == "<-" { break third }
                if inputHeadCount == "0" { break first }
                
                if let input = Int(inputHeadCount), (1...3).contains(input) {
                    headCount = input
                    break
                }
                print("예매인원을 확인해주세요.\n")
            }
        }
        // 유효성 검사(3) : 예매인원 설정(최대 3인)
        // - 완료
        // - 별도의 함수 생성하지 않고 while문으로 구현
        
        
    fourth: while true {
        var selectedSeat: String
        repeat {
            print(line)
            print("좌석을 선택해 주세요 (ex.A1 A2 A3)")
            print("    1  2  3  4")
            for (i, pick) in time.pickedSeat.enumerated() {
                print([" A ", " B ", " C "][i], terminator: "")
                for p in pick {
                    print(p, terminator: "")
                }
                print("")
            }
            print("\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
            selectedSeat = readLine()!
            if selectedSeat == "<-" { break fourth }
            if selectedSeat == "0" { break first }

            if !selectedSeat.validateSeat(headCount: headCount) {
                print("잘못 입력했습니다. 다시 입력해주세요.\n")
            } else if !selectedSeat.isSeatAlreadySelected(pickedSeat: time.pickedSeat) {
                print("이미 선택된 좌석입니다. 다른 좌석을 선택해주세요.\n")
            } else {
                break
            }
        } while true
        // 유효성 검사(4) : 입력값 검증
        // - 완료
        // - TimeTable validateSelectedSeat 함수 생성
        // - 예매인원과 동일한 숫자로 입력할 수 있게 검증(validateHeadCountAndSelectedSeat 함수 생성)
        // - 2개 이상의 좌석을 예매할 때 띄어쓰기로 구분자 지정
        // - 예매완료된 좌석 선택 불가 및 재선택 안내
        
        
    fifth: while true {
        print(line)
        var phoneNumber: String?
        while true {
            print("회원님의 휴대전화 번호를 입력해주세요 (ex.010-0000-0000)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
            if let input = readLine() {
                if input == "<-" { break fifth }
                if input == "0" { break first }
                if input.validatePhoneNumber() {
                    phoneNumber = input
                    break
                }
            }
            print("휴대전화 번호의 형식이 올바르지 않습니다\n")
        }
        // 유효성 검사(5) : 입력값 검증(숫자, 구분자 "-")
        
        
        print(line)
        while true {
            print("결제를 진행하시겠습니까? (Y/N)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
            let input = readLine()!
            if input == "<-" { break }
            if input == "0" { break first }
            if input == "Y" {
                let calendar = Calendar.current
                let startTime = calendar.date(bySettingHour: 16, minute: 30, second: 0, of: Date())!
                let endTime = calendar.date(bySettingHour: 16, minute: 30, second: 0, of: Date())!
                if isCheckTime(startTime, endTime) {
                    print("🚫 결제 가능한 시간이 아닙니다. (16:00 ~ 16:30 점검시간) 3초 뒤 메인 화면으로 이동합니다. 🚫")
                    delay3Seconds()
                    break first
                }

                let balance = userBalance[phoneNumber!, default: Int.random(in: 5000...50000)]
                print("현재 고객님의 잔고는 \(balance)원 입니다")
                let (price, discount) = (Double(time.price), movie.getPromotion())
                let totalPrice = Int(price - price * discount) * headCount
                if balance < totalPrice {
                    print("잔고가 부족합니다\n메인 화면으로 이동합니다")
                    break first
                }
                userBalance[phoneNumber!, default: balance] -= totalPrice
                time.updateSeat(picked: selectedSeat)
                bookedList.append(Ticket(title: movie.title, timeTable: time, headCount: headCount, seats: selectedSeat, phoneNumber: phoneNumber!, payed: totalPrice))
                print("\(totalPrice)원이 결제되었습니다\n현재 고객님의 잔고는 \(userBalance[phoneNumber!]!)원 입니다")
                print("예매가 완료되었습니다")
                delay3Seconds()
                break first
            } else if input == "N" {
                print("결제가 취소되었습니다")
                delay3Seconds()
                break first
            } else {
                print("문자 입력이 잘못되었습니다. 다시 입력해주세요.\n")
            }
        }
        // 유효성 검사(6) : Y/N이 아닐때 다시 입력하라는 메세지
    }
    }
    }
    }
    }
        
    case "2":
    first: while true {
        print(line)
        print("예매 내역 조회\n")
        var phoneNumber: String?
        while true {
            print("조회하실 휴대폰 번호를 입력해주세요 (ex.010-0000-0000)\n\n<- : 뒤로 가기")
            if let input = readLine() {
                if input == "<-" { break }
                if input.validatePhoneNumber() {
                    phoneNumber = input
                    break
                }
            }
            print("휴대폰 번호의 형식이 올바르지 않습니다\n")
        }
        
        var list = bookedList.filter { $0.phoneNumber == phoneNumber }
        
        if list.isEmpty {
            print(line)
            print("예매 내역이 존재하지 않습니다. 이전 페이지로 이동합니다.")
            continue
        }
        
    second: while true {
        list = bookedList.filter { $0.phoneNumber == phoneNumber }
        var pickedIndex: Int? = nil
        print(line)
        while pickedIndex == nil {
            print("티켓을 출력/취소하실 영화 번호를 입력해주세요")
            list.enumerated().forEach { print("\($0.0+1). ", terminator: ""); $0.1.displayTicket() }
            print("\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
            if let input = readLine() {
                if input == "<-" { break second }
                if input == "0" { break first }
                
                if let index = Int(input), index > 0, index <= list.count {
                    pickedIndex = index - 1
                    break
                }
            }
            print(line)
            print("유효하지 않은 입력입니다. 다시 시도해주세요.\n")
        }
        
        let pickedTicket = list[pickedIndex!]
        
        // 유효성 검사(7) : 예매내역 없을 시 없다는 문구와 함께 자동 메인으로 돌아가기
        
        pickedTicket.displayTicket()
        
    third: while true {
        print(case2)
        print("\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        switch readLine()! {
        case "<-" :
            break third
        case "0" :
            break first
        case "1":
            print(line)
            print("티켓을 출력하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print(line)
                print("티켓 출력이 완료되었습니다")
                delay3Seconds()
                break first
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
            } else {
                delay3Seconds()
                break first
            }
        case "2":
            print(line)
            print("예매를 취소하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print(line)
                print("예매가 취소되었습니다")
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
                userBalance[phoneNumber!]! += pickedTicket.payed
                print("\(pickedTicket.payed)원이 환불되었습니다\n고객님의 현재 잔고는 \(userBalance[phoneNumber!]!)원 입니다")
                pickedTicket.timeTable.refundSeat(picked: pickedTicket.seats)
                bookedList.removeAll(where: {$0.hashValue() == pickedTicket.hashValue()})
                delay3Seconds()
                break first
            } else {
                delay3Seconds()
                break first
            }
        default: break
        }
    }
    }
    }
    default: break
    }
}
