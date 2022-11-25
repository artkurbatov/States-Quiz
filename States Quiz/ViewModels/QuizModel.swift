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
        
        quiz.append(Quiz(image: "test", answers: ["Alabama", "Mississippi", "Georgia", "South Carolina"], correctAnswer: "Alabama"))
        quiz.append(Quiz(image: "test", answers: ["Alaska", "Montana", "Florida", "Arizona"], correctAnswer: "Alaska"))
        quiz.append(Quiz(image: "test", answers: ["Arizona", "Utah", "New Mexico", "Colorado"], correctAnswer: "Arizona"))
        quiz.append(Quiz(image: "test", answers: ["Arkansas", "Oklahoma", "Missouri", "Kansas"], correctAnswer: "Arkansas"))
        quiz.append(Quiz(image: "test", answers: ["California", "Nevada", "Florida", "Idaho"], correctAnswer: "California"))
        quiz.append(Quiz(image: "test", answers: ["Colorado", "Utah", "Wyoming", "New Mexico"], correctAnswer: "Colorado"))
        quiz.append(Quiz(image: "test", answers: ["Connecticut", "Massachusetts", "Rhode Island", "New Jersey"], correctAnswer: "Connecticut"))
        quiz.append(Quiz(image: "test", answers: ["Delaware", "Connecticut", "Rhode Island", "Massachusetts"], correctAnswer: "Delaware"))
        quiz.append(Quiz(image: "test", answers: ["Florida", "Texas", "Hawaii", "Illinois"], correctAnswer: "Florida"))
        quiz.append(Quiz(image: "test", answers: ["Georgia", "Alabama", "Mississippi", "South Carolina"], correctAnswer: "Georgia"))
        quiz.append(Quiz(image: "test", answers: ["Hawaii", "Florida", "Louisiana", "Michigan"], correctAnswer: "Hawaii"))
        quiz.append(Quiz(image: "test", answers: ["Idaho", "Nevada", "Oregon", "Montana"], correctAnswer: "Idaho"))
        quiz.append(Quiz(image: "test", answers: ["Illinois", "Missouri", "Iowa", "Indiana"], correctAnswer: "Illinois"))
        quiz.append(Quiz(image: "test", answers: ["Indiana", "Missouri", "Ohio", "Illinois"], correctAnswer: "Indiana"))
        quiz.append(Quiz(image: "test", answers: ["Iowa", "Nebraska", "Wisconsin", "Kansas"], correctAnswer: "Iowa"))
        quiz.append(Quiz(image: "test", answers: ["Kentucky", "Tennessee", "Virginia", "North Carolina"], correctAnswer: "Kentucky"))
        quiz.append(Quiz(image: "test", answers: ["Louisiana", "Arkansas", "Mississippi", "Alabama"], correctAnswer: "Louisiana"))
        quiz.append(Quiz(image: "test", answers: ["Maine", "Vermont", "New Hampshire", "Idaho"], correctAnswer: "Maine"))
        quiz.append(Quiz(image: "test", answers: ["Maryland", "New Hampshire", "Delaware", "New Jersey"], correctAnswer: "Maryland"))
        quiz.append(Quiz(image: "test", answers: ["Massachusetts", "Connecticut", "Vermont", "Rhode Island"], correctAnswer: "Massachusetts"))
        quiz.append(Quiz(image: "test", answers: ["Michigan", "Minnesota", "Wisconsin", "Massachusetts"], correctAnswer: "Michigan"))
        quiz.append(Quiz(image: "test", answers: ["Minnesota", "Michigan", "Wisconsin", "Illinois"], correctAnswer: "Minnesota"))
        quiz.append(Quiz(image: "test", answers: ["Missouri", "Arkansas", "Illinois", "Indiana"], correctAnswer: "Missouri"))
        quiz.append(Quiz(image: "test", answers: ["Montana", "Oregon", "Idaho", "Washington"], correctAnswer: "Montana"))
        quiz.append(Quiz(image: "test", answers: ["Nebraska", "South Dakota", "Kansas", "Colorado"], correctAnswer: "Nebraska"))
        quiz.append(Quiz(image: "test", answers: ["Nevada", "Arizona", "Utah", "Oregon"], correctAnswer: "Nevada"))
        quiz.append(Quiz(image: "test", answers: ["New Hampshire", "Vermont", "Maine", "Massachusetts"], correctAnswer: "New Hampshire"))
        quiz.append(Quiz(image: "test", answers: ["New Jersey", "New York", "New Hampshire", "New Mexico"], correctAnswer: "New Jersey"))
        quiz.append(Quiz(image: "test", answers: ["New Mexico", "Arizona", "Colorado", "Utah"], correctAnswer: "New Mexico"))
        quiz.append(Quiz(image: "test", answers: ["New York", "New Jersey", "Delaware", "Pennsylvania"], correctAnswer: "New York"))
        quiz.append(Quiz(image: "test", answers: ["North Carolina", "Virginia", "South Carolina", "Georgia"], correctAnswer: "North Carolina"))
        quiz.append(Quiz(image: "test", answers: ["North Dakota", "Nebraska", "Montana", "Wyoming"], correctAnswer: "North Dakota"))
        quiz.append(Quiz(image: "test", answers: ["Ohio", "West Virginia", "Indiana", "Michigan"], correctAnswer: "Ohio"))
        quiz.append(Quiz(image: "test", answers: ["Oklahoma", "Kansas", "Arkansas", "Louisiana"], correctAnswer: "Oklahoma"))
        quiz.append(Quiz(image: "test", answers: ["Oregon", "Idaho", "Nevada", "Utah"], correctAnswer: "Oregon"))
        quiz.append(Quiz(image: "test", answers: ["Pennsylvania", "New York", "Maryland", "Ohio"], correctAnswer: "Pennsylvania"))
        quiz.append(Quiz(image: "test", answers: ["Rhode Island", "Connecticut", "Massachusetts", "New York"], correctAnswer: "Rhode Island"))
        quiz.append(Quiz(image: "test", answers: ["South Carolina", "North Carolina", "Virginia", "Tennessee"], correctAnswer: "South Carolina"))
        quiz.append(Quiz(image: "test", answers: ["South Dakota", "Nebraska", "Wyoming", "Iowa"], correctAnswer: "South Dakota"))
        quiz.append(Quiz(image: "test", answers: ["Tennessee", "Kentucky", "Virginia", "North Carolina"], correctAnswer: "Tennessee"))
        quiz.append(Quiz(image: "test", answers: ["Texas", "Alaska", "Florida", "New Mexico"], correctAnswer: "Texas"))
        quiz.append(Quiz(image: "test", answers: ["Utah", "Nevada", "Wyoming", "Iowa"], correctAnswer: "Utah"))
        quiz.append(Quiz(image: "test", answers: ["Vermont", "New Hampshire", "New Jersey", "Maine"], correctAnswer: "Vermont"))
        quiz.append(Quiz(image: "test", answers: ["Virginia", "Maryland", "Kentucky", "North Carolina"], correctAnswer: "Virginia"))
        quiz.append(Quiz(image: "test", answers: ["Washington", "Oregon", "Montana", "Alaska"], correctAnswer: "Washington"))
        quiz.append(Quiz(image: "test", answers: ["West Virginia", "Virginia", "Ohio", "Indiana"], correctAnswer: "West Virginia"))
        quiz.append(Quiz(image: "test", answers: ["Wisconsin", "Michigan", "Minnesota", "Illinois"], correctAnswer: "Wisconsin"))
        quiz.append(Quiz(image: "test", answers: ["Wyoming", "Nebraska", "Colorado", "Utah"], correctAnswer: "Wyoming"))
        
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
