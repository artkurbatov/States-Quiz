//
//  HomeViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 23.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureLabels()
        configureStartButton()
    }
    
    private func configureLabels() {
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        
        titleLabel.text = "States Quiz"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        
        messageLabel.text = "Test your knowledge of USA maps. You will be given a highlighted state on the map and 4 answers. Are you ready?"
        messageLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
    }
    
    private func configureStartButton(){
        
        view.addSubview(startButton)
        
        startButton.configuration = .filled()
        startButton.configuration?.cornerStyle = .capsule
        startButton.configuration?.title = "Play"
        startButton.configuration?.baseBackgroundColor = .systemGreen
        
        startButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func buttonTap() {
        
        let tabVC = TabBarController()
        
        tabVC.modalPresentationStyle = .fullScreen
        tabVC.modalTransitionStyle = .partialCurl
        
        present(tabVC, animated: true)
    }
    
}
