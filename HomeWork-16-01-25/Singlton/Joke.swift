//
//  Joke.swift
//  HomeWork-16-01-25
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let joke: String?
    let setup: String?
    let delivery: String?
    

    var isTwoPart: Bool {
        return setup != nil && delivery != nil
    }
}
