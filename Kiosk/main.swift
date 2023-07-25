//
//  main.swift
//  Kiosk
//
//  Created by 김서온 on 2023/07/24.
//

import Foundation


class Movie {
    var title: String
    var time: [String]
    var price: Int {
        switch time {
        case ["09:30", "22:45"] : return 10000
        default : return 18000
        }
    }
    var pickedSeat: [[String]] = [["A1", "A2", "A3", "A4"],
                                  ["B1", "B2", "B3", "B4"],
                                  ["C1", "C2", "C3", "C4"]]
    var remainedSeat: Int = 12
    
    init(title: String, time: [String]) {
        self.title = title
        self.time = time
    }
}

class Movie1 : Movie {
    override init(title: String, time: [String]) {
        super.init(title: "엘리멘탈", time: ["09:30", "11:00", "11:45", "12:30", "16:40", "20:20", "22:45"])
    }
}

class Movie2 : Movie {
    override init(title: String, time: [String]) {
        super.init(title: "바비", time: ["11:00", "12:30", "16:40", "20:20", "22:45"])
    }
}

class Movie3 : Movie {
    override init(title: String, time: [String]) {
        super.init(title: "명탐정코난", time: ["09:30", "11:00", "11:45", "12:30", "16:40"])
    }
}

class Movie4 : Movie {
    override init(title: String, time: [String]) {
        super.init(title: "인시디어스", time: ["16:40", "20:20", "22:45"])
    }
}

class Movie5 : Movie {
    override init(title: String, time: [String]) {
        super.init(title: "미션임파서블 7", time: ["11:45", "16:40", "20:20", "22:45"])
    }
}

let movie1 = Movie1(title: "", time: [])
let movie2 = Movie2(title: "", time: [])
let movie3 = Movie3(title: "", time: [])
let movie4 = Movie4(title: "", time: [])
let movie5 = Movie5(title: "", time: [])
let allMovies: [Movie] = [movie1, movie2, movie3, movie4, movie5]


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


while true {
    switch inputNumber {
    case "1":
        print(dash)
        print("<예매차트>")
        for (index, movie) in allMovies.enumerated() {
            print("\(index + 1). \(movie.title)")
        }
        print(dash)
        print("영화를 선택해주세요.")
        var inputMovieNumber = readLine()!
    
        while true {
            if let movieIndex = Int(inputMovieNumber), movieIndex > 0, movieIndex <= allMovies.count {
                let selectedMovie = allMovies[movieIndex - 1]
                print(dash)
                print("<\(selectedMovie.title) 상영 시간표>")
                for time in selectedMovie.time {
                    print(time)
                }
                
                print(dash)
                print("영화시간을 입력해주세요. (ex. HH:MM)")
                var inputTime = readLine()!
                
                
                print(dash)
                print("예매하실 인원을 입력해주세요. (최대 3인)")
                while true {
                    var inputHeadCount = readLine()!
                    if let headCount = Int(inputHeadCount), headCount > 0, headCount <= 3 {
                        print(dash)
                        print("<좌석표>")
                        let selectedMovie = allMovies[movieIndex - 1]
                        for row in selectedMovie.pickedSeat {
                            let rowSeats = row.joined(separator: " ")
                            print(rowSeats)
                            
                        }
                        
                        print(dash)
                        print("좌석을 선택해주세요")
                        while true {
                            var inputSelectedSeats = readLine()!.split(separator: " ").map(String.init)
                            if selectedMovie.pickedSeat.contains(where: { row in row.contains(inputSelectedSeat) }) {
                                print(dash)
                                print("예매자 정보를 입력해주세요. (휴대폰번호 형식: 010-0000-0000)")
                                var inputPhoneNumber = readLine()!

                                // 휴대폰번호 형식 확인하는 함수
                                func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
                                    let phoneNumberRegex = "^010-\\d{4}-\\d{4}$"
                                    let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
                                    return phonePredicate.evaluate(with: phoneNumber)
                                }

                                while true {
                                    if isValidPhoneNumber(inputPhoneNumber) {
                                        let randomAmount = Int.random(in: 10000...200000)
                                        if randomAmount >= selectedMovie.price {
                                            print(dash)
                                            print("결제를 진행하시겠습니까? (Y/N)")
                                            var inputPaymentChoice = readLine()!.uppercased()
                                            
                                            if inputPaymentChoice == "Y" {
                                                print(dash)
                                                print("결제가 완료되었습니다. 예매가 완료되었습니다.")
                                            } else {
                                                print(dash)
                                                print("결제가 취소되었습니다. 예매가 취소되었습니다.")
                                            }
                                        } else {
                                            print(dash)
                                            print("예매 비용이 부족합니다. 금액을 추가 결제해주세요.")
                                        }
                                    } else {
                                        print(dash)
                                        print("올바른 휴대폰번호 형식을 입력해주세요. (ex. 010-0000-0000)")
                                        inputPhoneNumber = readLine()!
                                    }
                                }

                                
                                
                                    break
                                } else {
                                    print(dash)
                                    print("유효하지 않은 좌석입니다. 다시 입력해주세요.")
                                }
                        }
                    }
                    else {
                        print(dash)
                        print("예매인원을 확인해주세요. (최대 3인)")
                    }
                }
                
                
                
            } else {
                print(dash)
                print("올바른 영화 번호를 입력해주세요.")
                inputMovieNumber = readLine()!
            }
        }
        
        
        
//    case "2":
            
    default :
        print(inputError)
        print("원하시는 항목을 입력해주세요.")
        print(mainMenu)
        inputNumber = readLine()!
    }
}
