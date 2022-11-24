//
//  ContenModel.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 10.11.2022.
//

import Foundation
import UIKit
import SnapKit

class QuizModel {
    
    var quiz = [Quiz]()
    
    init() {
        
        quiz.append(Quiz(id: 0, image: "test", answers: ["Alabama", "New York", "South Carolina", "Wisconsin"], correctAnswer: "New York"))
        quiz.append(Quiz(id: 0, image: "test", answers: ["Texas", "Washington", "North Carolina", "Wisconsin"], correctAnswer: "Texas"))
        
        quiz.shuffle()
    }
    
    func createTab(rootview: UIViewController, title: String, image: String) -> UINavigationController {
        let vc = UINavigationController(rootViewController: rootview)
        vc.tabBarItem.image = UIImage(systemName: image)
        vc.tabBarItem.title = title
        return vc
    }
    
    func hasNext(currentIndex: Int) -> Bool {
        
        return currentIndex + 1 < quiz.count
    }
    
    func createResultAlert(title: String, numberOfCorrectAnswers numCorrect: Int, sender: GameViewController) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: "You got \(numCorrect) out of \(quiz.count) questions", preferredStyle: .alert)
        
        let backAction = UIAlertAction(title: "Back to menu", style: .default) { _ in
            sender.navigationController?.popToRootViewController(animated: true)
        }
        
        let shareAction = UIAlertAction(title: "Share", style: .default) { _ in
            let shareController = self.createActivityController(score: numCorrect)
            //shareController.popoverPresentationController?.sourceItem =
            sender.present(shareController, animated: true)
            sender.navigationController?.popToRootViewController(animated: true)
        }
        
        let playAgain = UIAlertAction(title: "Play again", style: .default) { _ in
            sender.restartGame()
        }
        
        alert.addAction(playAgain)
        alert.addAction(shareAction)
        alert.addAction(backAction)
        
        return alert
    }
    
    func createActivityController(score: Int) -> UIActivityViewController {
        
        let activityController = UIActivityViewController(activityItems: ["I got \(score) out of \(quiz.count) questions correctly! Check it out!"], applicationActivities: [])
        return activityController
    }
    
    func createButton(title: String, cornerStyle: UIButton.Configuration.CornerStyle) -> UIButton {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.title = title
        button.configuration?.cornerStyle = cornerStyle
        return button
    }
}
