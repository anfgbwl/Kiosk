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
        let timeComponents = time.split(separator: ":")
        let hour = Int(timeComponents[0]) ?? 0
        let minutes = Int(timeComponents[1]) ?? 0
        
        // 조조 할인 (07:00 ~ 09:50)
        if (hour == 7 && minutes >= 0) || (hour == 8) || (hour == 9 && minutes <= 50) {
            return 10000
        }
        
        // 심야 할인 (22:45 ~ 23:59)
        if (hour == 22 && minutes >= 45) || (hour == 23) {
            return 10000
        }
        
        return 18000 // 그 외의 시간
    }
    var pickedSeat: [[String]] = Array(repeating:Array(repeating: "[ ]", count: 10), count: 3)// 이차원배열 -> 이미 예매된 자리 "x" 표시
    var remainedSeat = 30 // 남은 좌석 수
    
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
            // Enter 입력 전 입력값 저장하지 않기...ㅜㅠ
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
