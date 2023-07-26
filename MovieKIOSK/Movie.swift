//
//  Movie.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
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
    
    func getPromotion() -> Double {
        print("프로모션이 존재하지 않습니다")
        return 0
    }
}

class Elemental: Movie {
    init() {
        super.init("엘리멘탈", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }

    override func getPromotion() -> Double {
        // 가격 할인
        print("[20%] 할인이 적용됩니다")
        return 0.2
    }
}

class Barbie: Movie {
    init() {
        super.init("바비", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }
    
    override func getPromotion() -> Double {
        // 바비인형 증정
        print("증정품 [바비인형]을 수령하실 수 있습니다")
        return 0
    }
}

class Conan: Movie {
    init() {
        super.init("명탐정 코난", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
        
    }
    
    override func getPromotion() -> Double {
        // 포토티켓
        print("증정품 [포토 티켓]을 수령하실 수 있습니다")
        return 0
    }
}

class Insidious: Movie {
    init() {
        super.init("인시디어스", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }
}
