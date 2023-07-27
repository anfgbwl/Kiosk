//
//  KIOSKManager.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

let titleList = ["엘리멘탈", "바비", "명탐정 코난", "인시디어스"]
let timeList: [TimeTable] = [TimeTable("09:30"), TimeTable("11:00"), TimeTable("11:45"), TimeTable("12:30"), TimeTable("16:30"), TimeTable("20:20"), TimeTable("20:45")]
var bookedList: [Ticket] = []

extension String {
    // 전화번호 검증
    func validatePhoneNumber() -> Bool {
        let phoneRegEx = "^010-[0-9]{4}-[0-9]{4}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return predicate.evaluate(with: self)
    }
    
    func validateSeat(headCount: Int) -> Bool {
        if self.isEmpty { return false }
        
        let selectedSeats = self.components(separatedBy: " ")
        if selectedSeats.count != headCount { return false }
        
        let seatPattern = "^[A-C][1-4]$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", seatPattern)
        for seat in selectedSeats {
            if !predicate.evaluate(with: seat) { return false }
        }
        return true
    }
    
    func isSeatAlreadySelected(pickedSeat: [[String]]) -> Bool {
        let seats = self.components(separatedBy: " ")
        for seat in seats {
            var s = seat
            let rowStr = s.removeFirst()
            let rowNum = ["A", "B", "C"].firstIndex(of: rowStr)
            if pickedSeat[rowNum!][Int(s)!-1] == "[X]" {
                return false
            }
        }
        return true
    }
}



func Delay3Seconds() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("메인 화면으로 이동합니다")
    }
    RunLoop.current.run(until: Date().addingTimeInterval(3))
}
