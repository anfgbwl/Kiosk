//
//  main.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

var movieList: [Movie] = [Elemental(), Barbie(), Conan(), Insidious()]
var userBalance = [String: Int]()

func printMessage() {
    let timeTableInstance = TimeTable("00:00")
    let currentTime = timeTableInstance.getCurrentTime()
    
    print("\n현재 시간: \(currentTime)\n")
    print("----------------------------------")
    print("       🍿 가장 빠른 상영작 🍿")
    for movie in movieList {
        for m in movie.timeTable {
            if m.time >= currentTime {
                print("   \(movie.title) \(m.time)  \(m.price)  \(m.remainedSeat)/12")
                break
            }
        }
    }
    print("----------------------------------")

}

let timer = DispatchSource.makeTimerSource()
timer.schedule(deadline: .now(), repeating: .seconds(20), leeway: .seconds(0))
timer.setEventHandler {
    printMessage()
}
timer.resume()

print("\n\t🎬🍿\n[5조 영화관에 오신걸 환영합니다🥳]")

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
        print("❌잘못된 입력입니다. 메뉴 번호를 똑바로 보고 다시 입력해주세요.❌")
    }
    
    switch choice {
    case "1":
    first: while true {
        print(line)
        print("[ 예매 차트 ]\n")
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
            print("❌잘못된 입력입니다. 영화 번호를 다시 입력해주세요.❌")
        } while movieIndex == nil
        let movie = movieList[movieIndex!]
        
    second: while true {
        print(line)
        print("[ 상영 시간표 ]\n")

        let timeTableInstance = TimeTable("00:00")
        let currentTime = timeTableInstance.getCurrentTime()
        var validTime = 0
        var availableList: [TimeTable] = []
        
        print("선택한 영화: \(movie.title)")
        print("현재 시간: \(currentTime)\n")
        
        print("   [시간]  [가격] [잔여 좌석]")
        for timeTable in movie.timeTable {
            if timeTable.time >= currentTime {
                validTime += 1
                availableList.append(timeTable)
                print("\(validTime). \(timeTable.time)  \(timeTable.price)  \(timeTable.remainedSeat)/12")
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
                    print("❌예매하실 상영 시간의 번호를 확인해주세요.❌")
                }
            }
        }
        let time = movie.timeTable[timeIndex!]
        
        
    third: while true {
        print(line)
        var headCount: Int = 0
        print("예매하실 인원 수를 입력해주세요. (최대 3인)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        while true {
            if let inputHeadCount = readLine() {
                if inputHeadCount == "<-" { break third }
                if inputHeadCount == "0" { break first }
                
                if let input = Int(inputHeadCount), (1...3).contains(input) {
                    headCount = input
                    break
                }
                print("❌예매인원을 확인해주세요.❌")
            }
        }
        
    fourth: while true {
        var selectedSeat: String
        print(line)
        print("[ 좌석 배치도 ]\n")
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
        repeat {
            selectedSeat = readLine()!
            if selectedSeat == "<-" { break fourth }
            if selectedSeat == "0" { break first }

            if !selectedSeat.validateSeat(headCount: headCount) {
                print("❌잘못 입력했습니다. 다시 입력해주세요.❌")
            } else if !selectedSeat.isSeatAlreadySelected(pickedSeat: time.pickedSeat) {
                print("❌이미 선택된 좌석입니다. 다른 좌석을 선택해주세요.❌")
            } else {
                break
            }
        } while true
        
    fifth: while true {
        print(line)
        var phoneNumber: String?
        print("회원님의 휴대전화 번호를 입력해주세요. (ex.010-0000-0000)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        while true {
            if let input = readLine() {
                if input == "<-" { break fifth }
                if input == "0" { break first }
                if input.validatePhoneNumber() {
                    phoneNumber = input
                    break
                }
            }
            print("❌휴대전화 번호의 형식이 올바르지 않습니다.❌")
        }
        
        print(line)
        print("결제를 진행하시겠습니까? (Y/N)\n\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        while true {
            let input = readLine()!
            if input == "<-" { break }
            if input == "0" { break first }
            if input == "Y" {
                let calendar = Calendar.current
                let startTime = calendar.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!
                let endTime = calendar.date(bySettingHour: 16, minute: 30, second: 0, of: Date())!
                if isTimeCheck(startTime, endTime) {
                    print("🚫 결제 가능한 시간이 아닙니다. (16:00 ~ 16:30 점검시간) 🚫")
                    delay3Seconds()
                    break first
                }
                
                
                let balance = userBalance[phoneNumber!] ?? Int.random(in: 5000...70000)
                userBalance[phoneNumber!, default: balance] += 0
                print(line)
                let (price, discount) = (Double(time.price), movie.getPromotion())
                let totalPrice = Int(price - price * discount) * headCount
                if balance < totalPrice {
                    print("현재 잔고는 \(balance)원으로 \(totalPrice-balance)원이 부족합니다.")
                    delay3Seconds()
                    break first
                }
                userBalance[phoneNumber!]! -= totalPrice
                time.updateSeat(picked: selectedSeat)
                bookedList.append(Ticket(title: movie.title, timeTable: time, headCount: headCount, seats: selectedSeat, phoneNumber: phoneNumber!, payed: totalPrice))
                print("\(totalPrice)원이 결제되어 현재 고객님의 잔고는 \(userBalance[phoneNumber!]!)원 입니다.")
                print("예매가 완료되었습니다.")
                delay3Seconds()
                break first
            } else if input == "N" {
                print(line)
                print("결제가 취소되었습니다.")
                delay3Seconds()
                break first
            }else {
                print("❌문자 입력이 잘못되었습니다. 다시 입력해주세요.❌")
            }
            
        }
    }
    }
    }
    }
    }
        
    case "2":
    first: while true {
        print(line)
        print("[ 회원 조회 ]\n")
        var phoneNumber: String?
        print("조회하실 휴대폰 번호를 입력해주세요. (ex.010-0000-0000)\n\n<- : 뒤로 가기")
        while true {
            if let input = readLine() {
                if input == "<-" { break first }
                if input.validatePhoneNumber() {
                    phoneNumber = input
                    break
                }
            }
            print("❌휴대폰 번호의 형식이 올바르지 않습니다.❌")
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
        print("[ 예매 내역 목록 ]\n")
        print("티켓을 출력/취소하실 영화 번호를 입력해주세요.\n")
        print("   [제목]   [시간]  [가격]  [인원]  [좌석]")
        list.enumerated().forEach { print("\($0.0+1). ", terminator: ""); $0.1.displayTicket() }
        print("\n<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        while pickedIndex == nil {
            if let input = readLine() {
                if input == "<-" { break second }
                if input == "0" { break first }
                
                if let index = Int(input), index > 0, index <= list.count {
                    pickedIndex = index - 1
                    break
                }
            }
            print("❌유효하지 않은 입력입니다. 다시 시도해주세요.❌")
        }
        
        let pickedTicket = list[pickedIndex!]
        print(case2)
        print("<- : 뒤로 가기 / 0 : 메인 화면으로 이동")
        
    third: while true {
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
                print("티켓 출력이 완료되었습니다.")
                delay3Seconds()
                break first
            } else {
                delay3Seconds()
                break first
            }
        case "2":
            print(line)
            print("예매를 취소하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print(line)
                print("예매가 취소되었습니다.")

                userBalance[phoneNumber!]! += pickedTicket.payed
                print("\(pickedTicket.payed)원이 환불되었습니다.\n고객님의 현재 잔고는 \(userBalance[phoneNumber!]!)원 입니다.")
                pickedTicket.timeTable.refundSeat(picked: pickedTicket.seats)
                bookedList.removeAll(where: {$0.hashValue() == pickedTicket.hashValue()})
                delay3Seconds()
                break first
            } else {
                delay3Seconds()
                break first
            }
        default: print("❌유효하지 않은 입력입니다. 다시 시도해주세요.❌")
        }
    }
    }
    }
    default: break
    }
}
