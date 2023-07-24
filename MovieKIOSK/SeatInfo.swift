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
    
    override func displayInfo() {
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
            let p = Array(pi)
            let row = p[0] == ("A") ? 0 : p[0] == ("B") ? 1 : 2
            pickedSeat[row][Int(String(p[1]))!-1] = "[X]"
        }
        remainedSeat -= picked.count
    }
}
