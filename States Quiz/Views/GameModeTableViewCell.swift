//
//  GameModeTableViewCell.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 30.12.2022.
//

import UIKit

class GameModeTableViewCell: UITableViewCell {
    
    private let bgView = UIView()
    private let clearBgView = UIView()
    private let label = UILabel()
    
    
    
    func configureCell() {
        
        backgroundView = clearBgView
        clearBgView.backgroundColor = .clear
        
        clearBgView.addSubview(bgView)
        
        bgView.backgroundColor = .systemBlue
        bgView.layer.cornerRadius = 20
        
        bgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
    }
}
