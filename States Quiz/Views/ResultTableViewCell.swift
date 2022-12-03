//
//  ResultTableViewCell.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 03.12.2022.
//

import UIKit
import SnapKit

class ResultTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let scoreLable = UILabel()
    private let attemptsStack = UIStackView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(resultToDisplay: Result) {
        
        addSubview(titleLabel)
        addSubview(scoreLable)
        //addSubview(attemptsStack)
        
        titleLabel.text = resultToDisplay.gameTitle
        titleLabel.textAlignment = .left
        titleLabel.textColor = resultToDisplay.attemptsLeft > 0 ? .systemGreen : .systemRed
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        //scoreLable.text = resultToDisplay?.score
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        scoreLable.text = resultToDisplay.score
        scoreLable.textAlignment = .left
        scoreLable.font = UIFont.systemFont(ofSize: 10)
        
        scoreLable.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        
        
    }
}
