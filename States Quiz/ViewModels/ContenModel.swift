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
        
        quiz.append(Quiz(id: 0, image: "test", answers: ["Alabama", "New York", "South Carolina", "Wisconsin"], correctAnswer: "New York"))
        quiz.append(Quiz(id: 0, image: "test", answers: ["Texas", "Washington", "North Carolina", "Wisconsin"], correctAnswer: "Texas"))
    }
    
    func hasNext(currentIndex: Int) -> Bool {
        
        return currentIndex + 1 < quiz.count
    }
}
