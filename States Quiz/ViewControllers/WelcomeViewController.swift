//
//  HomeViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 23.01.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let iconImageView = UIImageView()
    private let startButton = UIButton()
    
    private let appState = ApplicationState.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureTitle()
        configureIcon()
        configureMessage()
        configureStartButton()
    }
    
    private func configureTitle() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "States Quiz"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
     
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    private func configureIcon() {
        
        view.addSubview(iconImageView)
        
        iconImageView.image = UIImage(named: "icon")
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 300),
            iconImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureMessage() {
        
        view.addSubview(messageLabel)
        
        messageLabel.text = "Test your knowledge of USA maps. You will be given a highlighted state on the map and 4 answers.\nAre you ready?"
        messageLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
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
        
        appState.didLaunchBefore = true
        appState.saveStatus()
        
        present(tabVC, animated: true)
    }
    
}
