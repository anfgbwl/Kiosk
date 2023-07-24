//
//  main.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

var movieList: [SeatInfo] = []
for t in titleList {
    for time in timeList {
        movieList.append(SeatInfo(title: t, time: time))
    }
}
var titles = movieList as [Movie]
var timetables = movieList as [TimeTable]

print("\n5조 영화관에 오신걸 환영합니다")

var choice = "-1"
while choice != "0" {
    print(mainMsg)
    choice = readLine()!
    
    switch choice {
//    case "1":
//    case "2":
    default: break
    }
}

