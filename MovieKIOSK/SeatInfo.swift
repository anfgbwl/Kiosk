//
//  SeatInfo.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

class SeatInfo: TimeTable {
    var pickedSeat: [[String]] = Array(repeating:Array(repeating: "[ ]", count: 10), count: 3)// 이차원배열 -> 이미 예매된 자리 "x" 표시
    var remainedSeat = 30 // 남은 좌석 수
    
    override init(title: String, time: String) {
        super.init(title: title, time: time)
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
        var picked = picked.components(separatedBy: " ")
        for pi in picked {
            var p = pi
            var rowStr = p.removeFirst()
            let rowNum = ["A", "B", "C"].firstIndex(of: rowStr)
            pickedSeat[rowNum!][Int(p)!-1] = "[X]"
        }
        remainedSeat -= picked.count
    }
}
