//
//  Movie.swift
//  MovieKIOSK
//
//  Created by 이재희 on 2023/07/24.
//

import Foundation

class Movie {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func displayTitle() {
        print(title)
    }
}
