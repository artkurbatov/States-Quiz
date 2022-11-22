//
//  AlertViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 16.11.2022.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {
    
    private let alertView = UIView()
    
    private let menuButton: UIButton
    private let shareButton: UIButton
    private let playAgainButton: UIButton
    
    private let stackView = UIStackView()
    
    private let scoreLable = UILabel()
    private let resultLabel = UILabel()
    private let messageLabel = UILabel()

    let sender: GameViewController
    let numCorrect: Int
    let model = ContentModel()
    
    init(resultText: String, numCorrect: Int, sender: GameViewController) {
        
        self.menuButton = model.createButton(title: "Back to menu", cornerStyle: .medium)
        self.shareButton = model.createButton(title: "Share", cornerStyle: .capsule)
        self.playAgainButton = model.createButton(title: "Play again", cornerStyle: .medium)
        self.numCorrect = numCorrect
        self.resultLabel.text = resultText
        self.sender = sender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        setUpAlert()
        setUpResultLabel()
        setUpMessageLabel()
        setUpStackView()
        setUpShareButton()
        setButtonConstraints()
    }
    
    private func setUpAlert() {
        
        view.addSubview(alertView)
        alertView.backgroundColor = .systemBackground
        alertView.layer.borderWidth = 1
        alertView.layer.borderColor = UIColor.white.cgColor
        alertView.layer.cornerRadius = 20
        alertView.layer.masksToBounds = true
        
        alertView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    private func setUpResultLabel() {
        
        alertView.addSubview(resultLabel)
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        resultLabel.textAlignment = .center
                
        resultLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpMessageLabel() {
        
        alertView.addSubview(messageLabel)
        messageLabel.text = "You got \(numCorrect) out of \(model.quiz.count) questions correctly"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
                
        messageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
        }
    }
    
    // MARK: - Buttons Configuration
    
    private func setUpStackView() {
        
        alertView.addSubview(stackView)
        stackView.addArrangedSubview(menuButton)
        stackView.addArrangedSubview(playAgainButton)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setButtonConstraints() {
        
        menuButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        playAgainButton.addTarget(self, action: #selector(playAgainAction), for: .touchUpInside)
        
        for button in [menuButton, playAgainButton] {
            
            button.snp.makeConstraints { make in
                make.height.equalTo(40)
                make.width.equalToSuperview().multipliedBy(0.45)
            }
        }
    }

    private func setUpShareButton() {
        
        alertView.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        
        shareButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(menuButton.snp.top).offset(-50)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
    }
        
    // MARK: - Button actions
    
    @objc private func menuAction() {
        dismiss(animated: true) {
            self.sender.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc private func playAgainAction() {
        sender.restartGame()
        dismiss(animated: true)
    }
    
    @objc private func shareButtonAction() {
        let share = model.createActivityController(score: numCorrect)
        //share.popoverPresentationController?.sourceItem =
        #warning("iPad bug")
        present(share, animated: true)
    }
}
