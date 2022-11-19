//
//  AlertViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 16.11.2022.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {
    
    #warning("Share button placement")
    
    private let alertView = UIView()
    
    private let menuButton: UIButton
    private let shareButton: UIButton
    private let playAgainButton: UIButton
    
    private let stackView = UIStackView()
    
    private let scoreLable = UILabel()
    private let resultLabel = UILabel()

    let resultText: String
    let numCorrect: Int
    let sender: GameViewController
    
    let model = ContentModel()
    
    init(resultText: String, numCorrect: Int, sender: GameViewController) {
        
        self.menuButton = model.createButton(title: "Back to menu")
        self.shareButton = model.createButton(title: "Share")
        self.playAgainButton = model.createButton(title: "Play again")
        
        self.resultText = resultText
        self.numCorrect = numCorrect
        self.sender = sender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        menuButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        //shareButton.addTarget(self, action: #selector(), for: .touchUpInside)
        playAgainButton.addTarget(self, action: #selector(playAgainAction), for: .touchUpInside)
    
        setUpAlert()
        setUpResultLabel()
        setUpStackView()
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
        resultLabel.text = resultText
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        resultLabel.textAlignment = .center
                
        resultLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setUpStackView() {
        
        alertView.addSubview(stackView)
        stackView.addArrangedSubview(menuButton)
        //stackView.addArrangedSubview(shareButton)
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
        
        for button in [menuButton, playAgainButton] {
            
            button.snp.makeConstraints { make in
                make.height.equalTo(40)
                make.width.equalToSuperview().multipliedBy(0.45)
            }
        }
        
    }
    
    // MARK: - Button actions
    
    @objc private func menuAction() {
        dismiss(animated: true) {
            self.sender.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc private func playAgainAction() {
        dismiss(animated: true) {
            self.sender.restartGame()
        }
    }
}
