//
//  AlertViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 16.11.2022.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {
    
    #warning("Remove later")
    
    private var alertView = UIView()
    
    private var menuButton = UIButton()
    private var shareButton = UIButton()
    private var playAgainButton = UIButton()
    private var stackView = UIStackView()
    
    private var scoreLable = UILabel()
    private var resultLabel = UILabel()
    
    
    var resultText: String
    var numCorrect: Int
    var sender: GameViewController
    
    init(resultText: String, numCorrect: Int, sender: GameViewController) {
        
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
    
        setUpAlert()
        setUpResultLabel()
        setUpStackView()
        setUpGoToMenuButton()
        setUpShareButton()
        setUpPlayAgainButton()
    }
    
    
    private func setUpAlert() {
        
        view.addSubview(alertView)
        alertView.backgroundColor = .systemBackground
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
        stackView.addArrangedSubview(shareButton)
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
    
    private func setUpGoToMenuButton() {
        
        
        // TODO: Change button style
        menuButton.backgroundColor = .blue
        menuButton.setTitle("Menu", for: .normal)
        menuButton.layer.cornerRadius = 10
        menuButton.layer.masksToBounds = true
        
        menuButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        
        menuButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    private func setUpShareButton() {
        
        
        // TODO: Change button style
        //alertView.addSubview(goToManuButton)
        shareButton.backgroundColor = .blue
        shareButton.setTitle("Share", for: .normal)
        shareButton.layer.cornerRadius = 10
        shareButton.layer.masksToBounds = true
        
        shareButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        // add activity controller
    }
    
    private func setUpPlayAgainButton() {
        
        
        // TODO: Change button style
        //alertView.addSubview(goToManuButton)
        playAgainButton.backgroundColor = .blue
        playAgainButton.setTitle("Play again", for: .normal)
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.layer.masksToBounds = true
        
        playAgainButton.addTarget(self, action: #selector(playAgainAction), for: .touchUpInside)
        
        playAgainButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
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
        dismiss(animated: true) {
            self.sender.restartGame()
        }
    }
}
