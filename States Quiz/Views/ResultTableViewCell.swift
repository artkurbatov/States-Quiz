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
    private let statuesStack = UIStackView()
    private var statues = [UIImageView]()
    private let statue1 = UIImageView()
    private let statue2 = UIImageView()
    private let statue3 = UIImageView()
    private let statue4 = UIImageView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(resultToDisplay: Result) {
        
        statues = [statue1, statue2, statue3, statue4]
        
        for statue in statues {
            statue.alpha = 1
        }
        
        addSubview(titleLabel)
        addSubview(statuesStack)
        
        titleLabel.text = "\(resultToDisplay.gameTitle ?? "") (\(resultToDisplay.score ?? ""))"
        titleLabel.textAlignment = .left
        titleLabel.textColor = resultToDisplay.mistakeCounter < 4 ? .systemGreen : .systemRed
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        statuesStack.axis = .horizontal
        statuesStack.distribution = .equalSpacing
        
        
        let mistakeCounter = Int(resultToDisplay.mistakeCounter)
        
        for i in 0..<statues.count {
            
            statuesStack.addArrangedSubview(statues[i])
            statues[i].image = UIImage(named: "statue")
            
            if i < mistakeCounter {
                statues[i].alpha = 0.3
            }
        
            statues[i].snp.makeConstraints { make in
                make.width.equalTo(30)
                make.height.equalTo(statuesStack)
            }
        }
        statuesStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.33)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}
