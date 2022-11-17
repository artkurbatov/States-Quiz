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
    private var cancelButton = UIButton()
    var resultTitle = UILabel()
    
    var numCorrect: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        setUpAlert()
        setUpTitle()
        setUpCancelButton()
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
    
    private func setUpTitle() {
        
        alertView.addSubview(resultTitle)
        resultTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        resultTitle.textAlignment = .center
                
        resultTitle.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
       
        
    }
    
    private func setUpCancelButton() {
        
        alertView.addSubview(cancelButton)
        cancelButton.backgroundColor = .blue
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func cancelAction() {
        dismiss(animated: true)
    }
}
