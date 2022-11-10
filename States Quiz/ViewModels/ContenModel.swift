//
//  ContenModel.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 10.11.2022.
//

import Foundation

class ContentModel {
    
    var quiz = [Quiz]()
    
    init() {
        
        quiz.append(Quiz(id: 0, image: "test", answers: ["1", "2", "3", "4"], correctAnswer: "4"))
    }
    
}
