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
    
    func getPromotion() -> Double {
        return 0
    }
}

class Elemental: Movie {
    init() {
        super.init("엘리멘탈", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }

    override func getPromotion() -> Double {
        print("\n\n✅ [프로모션]: 결제 시 [20%] 할인이 적용됩니다.")
        return 0.2
    }
}

class Barbie: Movie {
    init() {
        super.init("바비", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }
    
    override func getPromotion() -> Double {
        print("\n\n✅ [프로모션]: 증정품 [바비인형]을 수령하실 수 있습니다.")
        return 0
    }
}

class Conan: Movie {
    init() {
        super.init("명탐정 코난", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
        
    }
    
    override func getPromotion() -> Double {
        print("\n\n✅ [프로모션]: 증정품 [포토 티켓]을 수령하실 수 있습니다.")
        return 0
    }
}

class Insidious: Movie {
    init() {
        super.init("인시디어스", [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("22:45"), TimeTable("23:55")])
    }
}
