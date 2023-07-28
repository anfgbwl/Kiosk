//
//  KIOSKManager.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

var bookedList: [Ticket] = []

extension String {
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
        
        var seatSet = Set<String>()
        
        for seat in selectedSeats {
            if !predicate.evaluate(with: seat) { return false }
            if seatSet.contains(seat) { return false }
            else { seatSet.insert(seat) }
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

func delay3Seconds() {
    print("\n⏱️ 3초 후 메인 화면으로 이동합니다.")
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        
    }
    RunLoop.current.run(until: Date().addingTimeInterval(3))
}

func isTimeCheck(_ startTime: Date, _ endTime: Date) -> Bool {
    let currentTime = Date()
    return currentTime >= startTime && currentTime <= endTime
}
