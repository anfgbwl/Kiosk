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
