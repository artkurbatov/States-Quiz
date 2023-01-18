//
//  GameModeTableViewCell.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 30.12.2022.
//

import UIKit

class GameModeTableViewCell: UITableViewCell {
    
    private let clearBgView = UIView()
    private let bgImageView = UIImageView()
    private let label = UILabel()
    
    func configureCell(text: String) {
        
        backgroundView = clearBgView
        clearBgView.backgroundColor = .clear
                
        clearBgView.addSubview(bgImageView)
        clearBgView.addSubview(label)
        
        bgImageView.image = UIImage(named: "flag")
        bgImageView.layer.cornerRadius = 10
        bgImageView.clipsToBounds = true
        bgImageView.alpha = 0.5
        
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 7
        label.clipsToBounds = true
    
        bgImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
