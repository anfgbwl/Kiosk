//
//  main.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

var movieList: [Movie] = []
for t in titleList {
    movieList.append(Movie(t, timeList))
}

print("\n5조 영화관에 오신걸 환영합니다")

var choice = "-1"
while choice != "0" {
    print(mainMsg)
    choice = readLine()!
    
    switch choice {
    case "1":
        print("예매 차트\n예매하실 영화의 번호를 입력해주세요")
        titleList.enumerated().forEach{ print("\($0.0+1). \($0.1)") }
        let titleIndex = Int(readLine()!)!
        let title = titleList[titleIndex-1]
        let movie = 
        
        print("예매하실 상영 시간의 번호를 입력해주세요")
        timeList.enumerated().forEach{ print("\($0.0+1). \($0.1)") }
        let timeIndex = Int(readLine()!)!
        let time = timeList[timeIndex-1]
        
        let seats = movieList[movieList.firstIndex(where: {$0.title == title && $0.timeTable == time})!]
        
        print("예매하실 인원 수를 입력해주세요")
        let headCount = Int(readLine()!)!
        
        print("좌석을 선택해 주세요 (ex.A1 A2 A3)")
        print("    1  2  3  4  5  6  7  8  9  10")
        for (i, pick) in seats.pickedSeat.enumerated() {
            print([" A ", " B ", " C "][i], terminator: "")
            for p in pick {
                print(p, terminator: "")
            }
            print("")
        }
        let pickedSeat = readLine()!
        seats.updateSeat(picked: pickedSeat)
        
        print("회원님의 휴대전화 번호를 입력해주세요 (ex.010-0000-0000)")
        let phoneNumber = readLine()!
        
        print("결제를 진행하시겠습니까? (Y/N)")
        if readLine()! == "Y" {
            //잔고가 충분하면
            bookedList.append(Ticket(title: title, timeTable: time, headCount: headCount, seats: pickedSeat, phoneNumber: phoneNumber))
            print("예매가 완료되었습니다")
        } else {
            print("결제가 취소되었습니다")
        }
    case "2":
        print("예매 내역 조회\n조회하실 휴대폰 번호를 입력해주세요 (ex.010-0000-0000)")
        let phoneNumber = readLine()!
        
        print("티켓 출력/예매 취소하실 영화 번호를 입력해주세요")
        let list = bookedList.filter { $0.phoneNumber == phoneNumber }
        list.enumerated().forEach { print("\($0.0+1). ", terminator: ""); $0.1.displayTicket() }
        let pickedIndex = Int(readLine()!)!-1 // pickedIndex == 0이면 처리
        let pickedTicket = list[pickedIndex]
        
        pickedTicket.displayTicket()
        print(case2)
        switch readLine()! {
        case "1":
            print("티켓을 출력하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print("티켓이 출력중입니다.")
                //n초 뒤
                print("티켓 출력이 완료되었습니다")
            } else {
                print("메인 화면으로 이동합니다")
                break
            }
        case "2":
            print("예매를 취소하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print("예매가 취소되었습니다")
                bookedList.removeAll(where: {$0.compareTicket() == pickedTicket.compareTicket()})
            } else {
                print("메인 화면으로 이동합니다")
                break
            }
        default: break
        }
    default: break
    }
}

