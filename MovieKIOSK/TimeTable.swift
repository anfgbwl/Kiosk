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
    
    // 좌석 입력 형태 검증 함수
    func validateSelectedSeat(_ input: String) -> Bool {
        let pattern = "^[A-C][1-4]$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: input.utf16.count)
        return regex.firstMatch(in: input, options: [], range: range) != nil
    }
    
    // 인원수 == 좌석수 검증
    func validateHeadCountAndSelectedSeat(_ input: String, headCount: Int) -> Bool {
    let pattern = "^[A-C][1-4]$"
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: input.utf16.count)

        let selectedSeats = input.components(separatedBy: " ")
        let uniqueSeats = Set(selectedSeats)
        let validSeats = selectedSeats.filter { validateSelectedSeat($0) }

        return uniqueSeats.count == validSeats.count && validSeats.count == headCount
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
