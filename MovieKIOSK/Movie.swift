//
//  Movie.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

class Movie {
    var title: String
    var timeTable: [TimeTable]
    
    init(_ title: String, _ timetable: [TimeTable]) {
        self.title = title
        self.timeTable = timetable
    }
    
    func displayTitle() {
        print(title)
    }
    
    func displayTimeTable() {
        for (i, t) in timeTable.enumerated() {
            print("\(i+1). \(t.time) \(t.price)")
        }
    }
    
    func setPromotion() {
        
    }
}

class Elemental: Movie {
    override func setPromotion() {
        //가격 할인
    }
}

class Barbie: Movie {
    override func setPromotion() {
        //바비인형 증정
    }
}

class Conan: Movie {
    override func setPromotion() {
        //포토티켓 증정
    }
}
