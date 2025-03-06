//
//  JokeFactory.swift
//  HomeWork-16-01-25
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import Foundation

protocol JokeFactory {
    func createJokeDisplay(joke: Joke) -> String
}

class SimpleJokeFactory: JokeFactory {
    func createJokeDisplay(joke: Joke) -> String {
        if joke.isTwoPart {
            return "\(joke.setup ?? "")\n\n\(joke.delivery ?? "")"
        } else {
            return joke.joke ?? "Шутка отсутствует."
        }
    }
}
