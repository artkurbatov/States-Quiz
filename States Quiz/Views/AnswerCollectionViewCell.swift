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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.white.cgColor : UIColor.black.cgColor
        layer.borderWidth = 1
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellText(text: String) {
        label.text = text
    }
}
