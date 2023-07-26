//
//  TimeTable.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

class TimeTable {
    var time: String // 상영시간
    var price: Int {
        switch time {
        case "09:30", "22:45" : return 10000
        default: return 18000
        }
    }
    var pickedSeat: [[String]] = Array(repeating:Array(repeating: "[ ]", count: 4), count: 3)// 이차원배열 -> 이미 예매된 자리 "x" 표시
    var remainedSeat = 12 // 남은 좌석 수

    init(_ time: String) {
        self.time = time
    }
    
    func displaySeats() {
        for pick in pickedSeat {
            for p in pick {
                print(p, terminator: "")
            }
            print("")
        }
    }
    
    // 현재 시간 HH:mm
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateNow = formatter.string(from: Date())
        return dateNow
    }
    
    // 좌석 형태 표현식
    let seatPattern = "^[A-C][1-4]$"

    // 좌석 입력 형태 검증 함수
    func validateSelectedSeat(_ input: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: seatPattern)
        let range = NSRange(location: 0, length: input.utf16.count)
        return regex.firstMatch(in: input, options: [], range: range) != nil
    }
    
    // 인원수 == 좌석수 검증
    func validateHeadCountAndSelectedSeat(_ input: String, headCount: Int) -> Bool {
        let selectedSeats = input.components(separatedBy: " ")
        let uniqueSeats = Set(selectedSeats)
        let validSeats = selectedSeats.filter { validateSelectedSeat($0) }

        return uniqueSeats.count == validSeats.count && validSeats.count == headCount
    }
    
    // 입력값을 띄어쓰기로 나눠서 배열에 추가하는 함수
    func addToSelectedSeats(_ input: String) {
        let seats = input.components(separatedBy: " ")
        if selectedSeats.contains(seats) {
            print("이미 예약된 좌석입니다. 다시 선택해주세요.")
        } else {
            for seat in seats {
                selectedSeats.append(seat)
            }
        }
    }
    
    // 이미 선택된 좌석을 입력받을 때, 배열에 포함되는지 확인하는 함수
    func isSeatAlreadySelected(_ input: String) -> Bool {
        let seats = input.components(separatedBy: " ")
        for seat in seats {
            if selectedSeats.contains(seat) {
                return true
            }
        }
        return false
    }
    
    
    func updateSeat(picked: String) {
        let picked = picked.components(separatedBy: " ")
        for pi in picked {
            var p = pi
            let rowStr = p.removeFirst()
            let rowNum = ["A", "B", "C"].firstIndex(of: rowStr)
            pickedSeat[rowNum!][Int(p)!-1] = "[X]"
            // 이미 선택된 자리를 입력할 때 나타낼 메시지 구현 필요
            // 2개 이상의 좌석을 입력할 때 구분자 지정
        }
        remainedSeat -= picked.count
    }
    
    func refundSeat(picked: String) {
        let picked = picked.components(separatedBy: " ")
        for pi in picked {
            var p = pi
            let rowStr = p.removeFirst()
            let rowNum = ["A", "B", "C"].firstIndex(of: rowStr)
            pickedSeat[rowNum!][Int(p)!-1] = "[ ]"
        }
        remainedSeat += picked.count
    }
}
