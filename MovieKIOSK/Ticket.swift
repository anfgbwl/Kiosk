//
//  Ticket.swift
//  MovieKIOSK
//
//  Created by 5조 on 2023/07/24.
//

import Foundation

struct Ticket {
    var title: String
    var timeTable: TimeTable
    var headCount: Int
    var seats: String
    var phoneNumber: String
    var payed: Int
    
    func displayTicket() {
        print("\(title)  \(timeTable.time)  \(payed)    \(headCount)     \(seats)")
    }
    
    func hashValue() -> String {
        return title+timeTable.time+seats+phoneNumber
    }
}
