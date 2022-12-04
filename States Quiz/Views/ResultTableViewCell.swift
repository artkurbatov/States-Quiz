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
    private let attemptsStack = UIStackView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(resultToDisplay: Result) {
        
        addSubview(titleLabel)
        
        titleLabel.text = "\(resultToDisplay.gameTitle ?? "") (\(resultToDisplay.score ?? ""))"
        titleLabel.textAlignment = .left
        titleLabel.textColor = resultToDisplay.attemptsLeft > 0 ? .systemGreen : .systemRed
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}
