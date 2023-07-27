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
        case "09:30", "22:45", "23:55" : return 10000
        default: return 18000
        }
    }
    var pickedSeat: [[String]] = Array(repeating:Array(repeating: "[ ]", count: 4), count: 3)// 이차원배열 -> 이미 예매된 자리 "x" 표시
    var remainedSeat = 12 // 남은 좌석 수
    var isNearestMovies = true

    
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
    
    func getNearestMovies() {
        isNearestMovies = true
        let currentTime = self.getCurrentTime()
        let nearestMovies = movieList.filter { $0.timeTable.contains { $0.time >= currentTime } }
                                          .prefix(3)
        DispatchQueue.global().async {
            while self.isNearestMovies {
                if !nearestMovies.isEmpty {
                    print("빠른 예매")
                    nearestMovies.forEach { movie in
                        if let firstTime = movie.timeTable.first {
                            print("\(movie.title) \(firstTime.time) \(firstTime.remainedSeat)/12")
                        } else {
                            print("현재 상영 중인 영화가 없습니다.")
                        }
                    }
                } else {
                    print("현재 상영 중인 영화가 없습니다.")
                }
                sleep(5)
            }
        }
    }
    
}
