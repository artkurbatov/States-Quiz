//
//  AnswerCollectionViewCell.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 11.11.2022.
//

import UIKit
import SnapKit

class AnswerCollectionViewCell: UICollectionViewCell {
    
    private var label = UILabel()
    
    
    func configureCell(text: String) {
        
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.95)
        }
        
        label.text = text
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
    }
    
}
