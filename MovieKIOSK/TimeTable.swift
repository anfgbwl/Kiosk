//
//  TimeTable.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

class TimeTable: Movie {
    var date: Date = Date() // 상영일
    var time: String // 상영시간
    var price: Int {
        switch time {
        case "09:30", "22:45" : return 10000
        default: return 18000
        }
    }
    
    init(title: String, time: String) {
        self.time = time
        super.init(title: title)
    }
    
    func displayTimetable() {
        print(time, price)
    }
}
