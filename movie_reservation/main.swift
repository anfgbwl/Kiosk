//
//  main.swift
//  movie_reservation
//
//  Created by Jongbum Lee on 2023/07/24.
//

import Foundation

class Movie {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func displayInfo() -> String {
        return "제목: \(title)"
    }
}

class TimeTable {
    var movie: Movie
    var time: Int
    var seat: [String]
    
    init(movie: Movie, time: Int, seat: [String]) {
        self.movie = movie
        self.time = time
        self.seat = seat
    }
    
    func displayInfo() -> String {
        return "제목: \(movie.title), 시간: \(time), 좌석: \(seat)"
    }
}

class Ticket {
    var timetable: TimeTable
    var headcount: Int
    var price: Int
    var bookedDate: String
    var phoneNumber: String
    
    init(timetable: TimeTable, headcount: Int, price: Int, bookedDate: String, phoneNumber: String) {
        self.timetable = timetable
        self.headcount = headcount
        self.price = price
        self.bookedDate = bookedDate
        self.phoneNumber = phoneNumber
    }
    
    func displayInfo() -> String {
        return timetable.displayInfo() + ", 인원: \(headcount), 가격: \(price)"
    }
}

class User {
    let
}


var movies: [Movie] = [
    Movie(title: "엘리멘탈"),
    Movie(title: "바비"),
    Movie(title: "명탐정코난"),
    Movie(title: "인시디어스"),
    Movie(title: "미션임파서블"),
]

var timeTable: [TimeTable] = []

var tickets: [Ticket] = []

var times = ["09:30", "11:00", "11:45", "12:30", "16:40", "20:20"]

repeat {
    print("원하시는 항목을 입력해주세요.")
    print("1. 현장구매")
    print("2. 예매내역 조회")
    
    if let input = readLine(), let choice = Int(input) {
        switch choice {
        case 1:
            print("영화명을 선택해주세요.")
            for (index, movie) in movies.enumerated() {
                print("\(index+1). \(movie.title)")
            }
            guard let movieInput = readLine(), let movieChoice = Int(movieInput), movieChoice <= movies.count else { continue }
            
            var selectedMovie = movies[movieChoice-1]
            var timetable = TimeTable(movie: selectedMovie, time: 0, seat: [])
            var ticket = Ticket(timetable: timetable, headcount: 0, price: 0, bookedDate: "", phoneNumber: "")
            
            print("인원 수를 입력해주세요.")
            guard let headcount = readLine() else { continue }
            
            if let headcountInt = Int(headcount) {
                ticket.headcount = headcountInt
            } else {
                // headcount를 Int로 변환할 수 없는 경우에 대한 처리
            }
            
            print("시간을 선택해 주세요.")
            print("1. 09:30 2. 11:00 3. 11:45 4. 12:30 5. 16:40 6. 20:20")
            guard let timeInput = readLine() else { continue }
            
            if let timeInputInt = Int(timeInput) {
                timetable.time = timeInputInt - 1
            } else {
                // headcount를 Int로 변환할 수 없는 경우에 대한 처리
            }
            
            
            print("좌석을 선택해주세요.")
            print("A1 A2 A3")
            print("A1 A2 A3")
            print("A1 A2 A3")
            print("A1 A2 A3")
            guard let seatInput = readLine() else { continue }
            let seats = seatInput.split(separator: " ").map { String($0) }
            
            timetable.seat = seats
            
            
            print("예매자 휴대폰번호를 입력해주세요.")
            guard let phoneInput = readLine() else { continue }
            
            ticket.phoneNumber = phoneInput
            
            print("결제하시겠습니까? Y/N")
            if let confirmInput = readLine(), confirmInput.lowercased() == "y" {
                let newTicket = ticket
                tickets.append(newTicket)
                print("예매완료 되었습니다.")
            } else {
                print("취소하셨습니다.")
            }
        case 2:
            print("조회하실 휴대폰번호를 입력해주세요.")
            if let phoneInput = readLine() {
                let myTickets = tickets.filter { $0.phoneNumber == phoneInput }
                for (index, ticket) in myTickets.enumerated() {
                    print("\(index+1). \(ticket.timetable.movie.title) \(ticket.timetable.time) \(ticket.timetable.seats.joined(separator: " "))")
                }
                
                print("출력하실 번호를 선택해주세요.")
                if let ticketInput = readLine(), let ticketChoice = Int(ticketInput), ticketChoice <= myTickets.count {
                    print("출력하시겠습니까? Y/N")
                    if let confirmInput = readLine(), confirmInput.lowercased() == "y" {
                        print("출력하였습니다.")
                    } else {
                        print("취소하셨습니다.")
                    }
                }
            }
        default:
            print("잘못된 입력입니다.")
        }
    }
} while true
