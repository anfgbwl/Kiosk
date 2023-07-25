//
//  Ticket.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

struct Ticket {
    var title: String
    var timeTable: TimeTable
    var headCount: Int
    var seats: String
    var bookedDate: Date = Date()
    var phoneNumber: String
    var payed: Int {
        timeTable.price * headCount
    }
    
    func displayTicket() {
        //print(timeTable.title, time, headCount, seats)
    }
}
