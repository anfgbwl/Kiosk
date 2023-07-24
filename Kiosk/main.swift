//
//  main.swift
//  Kiosk
//
//  Created by 김서온 on 2023/07/24.
//

import Foundation

//struct movie {
//    let title: String
//    let time: Date
//    let seat: Int
//}


class Movie {
    var title = ["엘리멘탈", "바비", "명탐정코난", "인시디어스", "미션임파서블 7"]
    
    func movieList() {
        for (index, movieTitle) in title.enumerated() {
            print("(\(index + 1)) \(movieTitle)")
        }
    }
}

class TimeTable: Movie {
    var time = ["09:30", "11:00", "11:45", "12:30", "16:40", "20:20", "22:45"]
    var seat = 12
    
    func timeList() {
        for (_, timeList) in time.enumerated() {
            print("\(timeList)")
        }
    }
}

class Ticket: TimeTable {
    var headCount: Int?
    var price = ["조조" : 10000, "일반" : 18000, "심야" : 10000]
    var phoneNumber: String?
}

//let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "kk:mm"

let inputError = "입력이 올바르지 않습니다. 다시 확인해주세요."
let mainMenu = """
                ----------------------
                1. 현장구매
                2. 예매내역 조회
                ----------------------
                """
let dash = "----------------------"

print("5조 영화관에 오신걸 환영합니다.")
print("원하시는 항목을 입력해주세요.")
print(mainMenu)

var inputNumber = readLine()!


repeat {
    switch inputNumber {
    case "00": break;
    case "1":
        print(dash)
        print("<예매차트>")
        let movieInstance = Movie()
        movieInstance.movieList()
        print(dash)
        print("영화를 선택해주세요.")
        var inputMovieNumber = readLine()!
        
        func processReservation() {
            print(dash)
            print("<상영시간>")
            if let choiceMovieIndex = Int(inputMovieNumber), (1...movieInstance.title.count).contains(choiceMovieIndex) {
                let choiceMovie = movieInstance.title[choiceMovieIndex - 1]
                print("\(inputMovieNumber) : \(choiceMovie)")
                
                let timeTableInstance = TimeTable()
                timeTableInstance.timeList()
                print(dash)
                print("영화 시간을 입력해주세요(ex. HH:MM)")
                var inputTime = readLine()!
            }
        }
        
        
        repeat {
            switch inputMovieNumber {
            case "1":
                processReservation()
            case "2":
                processReservation()
            case "3":
                processReservation()
            case "4":
                processReservation()
            case "5":
                processReservation()
            default:
                break
            }
        } while inputMovieNumber != "0"
        
        
        print(dash)
        print("예매하실 인원을 입력해주세요. (최대 3인)")
        var inputHeadCount = readLine()!
        
        if let headCount = Int(inputHeadCount) {
            if headCount > 3 || headCount <= 0{
                print("예매인원을 확인해주세요.")
                inputHeadCount = readLine()!
            } else {
                break
            }
        }
        
        
//    case "2":
            
    default :
        print(inputError)
        print("원하시는 항목을 입력해주세요.")
        print(mainMenu)
        inputNumber = readLine()!
    }
} while inputNumber != "0"
