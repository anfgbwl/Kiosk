//
//  main.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

/*
 
 역할분담
 1. 콘솔창꾸미기 : 허수빈
 2. 유효성 검사
    (1)~(2) : 허수빈
    (3)~(4) : 김서온
    (5) : 이재희
    (6)~(7) : 이종범
 
 ** 옵셔널 강제해제!! 확인 바랍니다.**
 
 */

import Foundation

var movieList: [Movie] = [Elemental(), Barbie(), Conan(), Insidious()]

print("\n5조 영화관에 오신걸 환영합니다")

var choice = "-1"
while choice != "0" {
    print(mainMsg)
    choice = readLine()!
    
    switch choice {
    case "1":
        print("예매 차트\n예매하실 영화의 번호를 입력해주세요")
        movieList.enumerated().forEach({ print("\($0.0+1). \($0.1.title)")})
        let movieIndex = Int(readLine()!)!
        let movie = movieList[movieIndex-1]
        // 유효성 검사(1) : 1,2,0 외 번호 입력 시 오류문 출력 후 재 안내
                
        print("예매하실 상영 시간의 번호를 입력해주세요")
        movie.timeTable.enumerated().forEach{ print("\($0.0+1). \($0.1.time) \($0.1.price) \($0.1.remainedSeat)/12") }
        let timeIndex = Int(readLine()!)!
        let time = movie.timeTable[timeIndex-1]
        // 유효성 검사(2) : 1,2,3,4 외 번호 입력 시 오류문 출력 후 재 안내
        
        var headCount: Int = 0
        while true {
            print("예매하실 인원 수를 입력해주세요. (최대 3인)")
            guard let inputHeadCount = readLine(), let input = Int(inputHeadCount), (1...3).contains(input) else {
                print("예매인원을 확인해주세요.")
                continue
            }
            headCount = input
            break
        }
        // 유효성 검사(3) : 예매인원 설정(최대 3인)
        // - 완료
        // - 별도의 함수 생성하지 않고 while문으로 구현
        
        
        print("좌석을 선택해 주세요 (ex.A1 A2 A3)")
        print("    1  2  3  4")
        for (i, pick) in time.pickedSeat.enumerated() {
            print([" A ", " B ", " C "][i], terminator: "")
            for p in pick {
                print(p, terminator: "")
            }
            print("")
        }
        var selectedSeat: String
        repeat {
            print("좌석을 선택해 주세요 (ex. A1 A2 A3)")
            selectedSeat = readLine()!
            if !time.validateHeadCountAndSelectedSeat(selectedSeat, headCount: headCount) {
                print("잘못 입력했습니다. 다시 입력해주세요.")
            }
        } while !time.validateHeadCountAndSelectedSeat(selectedSeat, headCount: headCount)
        // 유효성 검사(4) : 입력값 검증
        // - 완료
        // - TimeTable validateSelectedSeat 함수 생성
        // - 예매인원과 동일한 숫자로 입력할 수 있게 검증(validateHeadCountAndSelectedSeat 함수 생성)
        // - 2개 이상의 좌석을 예매할 때 띄어쓰기로 구분자 지정
        // (아직) 이미 선택된 자리를 입력할 때 나타낼 메시지 구현 필요
        
        print("회원님의 휴대전화 번호를 입력해주세요 (ex.010-0000-0000)")
        let phoneNumber = readLine()!
        // 유효성 검사(5) : 입력값 검증(숫자, 구분자 "-")
        
        print("결제를 진행하시겠습니까? (Y/N)")
        if readLine()! == "Y" {
            movie.getPromotion()
            // (유효성 이후 추가 기능) 지갑 기능, 잔고 있을 때 결제 되고 없으면 못함
            time.updateSeat(picked: selectedSeat)
            bookedList.append(Ticket(title: movie.title, timeTable: time, headCount: headCount, seats: selectedSeat, phoneNumber: phoneNumber))
            print("예매가 완료되었습니다")
        } else {
            print("결제가 취소되었습니다")
        }
        // 유효성 검사(6) : Y/N이 아닐때 다시 입력하라는 메세지

    case "2":
        print("예매 내역 조회\n조회하실 휴대폰 번호를 입력해주세요 (ex.010-0000-0000)")
        let phoneNumber = readLine()!
        
        print("티켓 출력/예매 취소하실 영화 번호를 입력해주세요")
        let list = bookedList.filter { $0.phoneNumber == phoneNumber }
        list.enumerated().forEach { print("\($0.0+1). ", terminator: ""); $0.1.displayTicket() }
        let pickedIndex = Int(readLine()!)!-1 // pickedIndex == 0이면 처리
        let pickedTicket = list[pickedIndex]
        // 유효성 검사(7) : 예매내역 없을 시 없다는 문구와 함께 자동 메인으로 돌아가기
        
        pickedTicket.displayTicket()
        print(case2)
        switch readLine()! {
        case "1":
            print("티켓을 출력하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print("티켓이 출력중입니다.")
                // (유효성 이후 추가 기능) n초 뒤 다음 print문
                print("티켓 출력이 완료되었습니다")
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
            } else {
                print("메인 화면으로 이동합니다")
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
                break
            }
        case "2":
            print("예매를 취소하시겠습니까? (Y/N)")
            if readLine()! == "Y" {
                print("예매가 취소되었습니다")
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
                pickedTicket.timeTable.refundSeat(picked: pickedTicket.seats)
                bookedList.removeAll(where: {$0.hashValue() == pickedTicket.hashValue()})
                print("메인 화면으로 이동합니다")
            } else {
                print("메인 화면으로 이동합니다")
                // (유효성 이후 추가 기능) n초 뒤 메인화면으로 돌아가기
                break
            }
        default: break
        }
    default: break
    }
}
