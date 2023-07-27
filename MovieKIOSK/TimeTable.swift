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
    
    func updateSeat(picked: String) {
        let picked = picked.components(separatedBy: " ")
        for pi in picked {
            var p = pi
            let rowStr = p.removeFirst()
            let rowNum = ["A", "B", "C"].firstIndex(of: rowStr)
            pickedSeat[rowNum!][Int(p)!-1] = "[X]"
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
