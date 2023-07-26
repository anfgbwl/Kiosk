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
var selectedSeats: [String] = []
