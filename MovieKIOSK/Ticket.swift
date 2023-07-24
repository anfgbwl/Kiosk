//
//  Ticket.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

class Ticket: TimeTable {
    var headCount: Int
    var seats: String
    var bookedDate: Date = Date()
    var phoneNumber: String
    var payed: Int {
        price * headCount
    }
    
    init(title: String, time: String, headCount: Int, seats: String, phoneNumber: String) {
        self.headCount = headCount
        self.seats = seats
        self.phoneNumber = phoneNumber
        super.init(title: title, time: time)
    }
    
    init(tTable: TimeTable, headCount: Int, seats: String, phoneNumber: String) {
        self.headCount = headCount
        self.seats = seats
        self.phoneNumber = phoneNumber
        super.init(title: tTable.title, time: tTable.time)
    }
    
    func displayTicket() {
        print(title, time, headCount, seats)
    }
    
    func compareTicket() -> (String, String, Int, String){
        return (title, time, headCount, seats)
    }
}
