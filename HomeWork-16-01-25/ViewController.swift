//
//  ViewController.swift
//  HomeWork-16-01-25
//
//  Created by Aleksandr Zhazhoyan on 06.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let jokeLabel = UILabel()
    let jokeButton = UIButton()
    let jokeFactory: JokeFactory = SimpleJokeFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchJoke()
    }
    
    func setupUI() {
        view.backgroundColor = .blue
        
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
        
        jokeButton.setTitle("Получить шутку", for: .normal)
        jokeButton.setTitleColor(.yellow, for: .normal)
        jokeButton.backgroundColor = .purple
        jokeButton.addTarget(self, action: #selector(fetchJoke), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [jokeLabel, jokeButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func fetchJoke() {
        JokeManager.shared.fetchRandomJoke { [weak self] joke in
            guard let self = self, let joke = joke else { return }
            let displayedJoke = self.jokeFactory.createJokeDisplay(joke: joke)

            self.jokeLabel.text = displayedJoke
        }
    }
}
