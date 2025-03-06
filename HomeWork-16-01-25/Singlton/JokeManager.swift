//
//  JokeManager.swift
//  HomeWork-16-01-25
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import Foundation

class JokeManager {
    static let shared = JokeManager()
    
    private init() {}
    
    func fetchRandomJoke(completion: @escaping (Joke?) -> Void) {
        let url = URL(string: "https://v2.jokeapi.dev/joke/Any")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let joke = try decoder.decode(Joke.self, from: data)
                    DispatchQueue.main.async {
                        completion(joke)
                    }
                } catch {
                    print("Ошибка парсинга: \(error)")
                    completion(nil)
                }
            } else {
                print("Ошибка загрузки данных: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                completion(nil)
            }
        }
        task.resume()
    }
}
