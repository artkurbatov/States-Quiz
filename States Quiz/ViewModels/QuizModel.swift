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
        
//        quiz.append(Quiz(image: "AL", answers: ["Alabama", "Mississippi", "Georgia", "South Carolina"], correctAnswer: "Alabama"))
//        quiz.append(Quiz(image: "AK", answers: ["Alaska", "Montana", "Florida", "Arizona"], correctAnswer: "Alaska"))
//        quiz.append(Quiz(image: "AZ", answers: ["Arizona", "Utah", "New Mexico", "Colorado"], correctAnswer: "Arizona"))
//        quiz.append(Quiz(image: "AR", answers: ["Arkansas", "Oklahoma", "Missouri", "Kansas"], correctAnswer: "Arkansas"))
//        quiz.append(Quiz(image: "CA", answers: ["California", "Nevada", "Florida", "Idaho"], correctAnswer: "California"))
//        quiz.append(Quiz(image: "CO", answers: ["Colorado", "Utah", "Wyoming", "New Mexico"], correctAnswer: "Colorado"))
        //quiz.append(Quiz(image: "CT", answers: ["Connecticut", "Massachusetts", "Rhode Island", "New Jersey"], correctAnswer: "Connecticut"))
        //quiz.append(Quiz(image: "DE", answers: ["Delaware", "Connecticut", "Rhode Island", "Massachusetts"], correctAnswer: "Delaware"))
       // quiz.append(Quiz(image: "FL", answers: ["Florida", "Texas", "Hawaii", "Illinois"], correctAnswer: "Florida"))
        //quiz.append(Quiz(image: "GA", answers: ["Georgia", "Alabama", "Mississippi", "South Carolina"], correctAnswer: "Georgia"))
        
        
        quiz.append(Quiz(image: "HI", answers: ["Hawaii", "Florida", "Louisiana", "Michigan"], correctAnswer: "Hawaii"))
        
        
        
//        quiz.append(Quiz(image: "ID", answers: ["Idaho", "Nevada", "Oregon", "Montana"], correctAnswer: "Idaho"))
//        quiz.append(Quiz(image: "IL", answers: ["Illinois", "Missouri", "Iowa", "Indiana"], correctAnswer: "Illinois"))
//        quiz.append(Quiz(image: "IN", answers: ["Indiana", "Missouri", "Ohio", "Illinois"], correctAnswer: "Indiana"))
//        quiz.append(Quiz(image: "IA", answers: ["Iowa", "Nebraska", "Wisconsin", "Kansas"], correctAnswer: "Iowa"))
//        quiz.append(Quiz(image: "KS", answers: ["Kansas", "Iowa", "Colorado", "Nebraska"], correctAnswer: "Kansas"))
//        quiz.append(Quiz(image: "KY", answers: ["Kentucky", "Tennessee", "Virginia", "North Carolina"], correctAnswer: "Kentucky"))
//        quiz.append(Quiz(image: "LA", answers: ["Louisiana", "Arkansas", "Mississippi", "Alabama"], correctAnswer: "Louisiana"))
        
        quiz.append(Quiz(image: "ME", answers: ["Maine", "Vermont", "New Hampshire", "Idaho"], correctAnswer: "Maine"))
        
        
        quiz.append(Quiz(image: "MD", answers: ["Maryland", "New Hampshire", "Delaware", "New Jersey"], correctAnswer: "Maryland"))
        
        
//        quiz.append(Quiz(image: "MA", answers: ["Massachusetts", "Connecticut", "Vermont", "Rhode Island"], correctAnswer: "Massachusetts"))
//        quiz.append(Quiz(image: "MI", answers: ["Michigan", "Minnesota", "Wisconsin", "Massachusetts"], correctAnswer: "Michigan"))
//        quiz.append(Quiz(image: "MN", answers: ["Minnesota", "Michigan", "Wisconsin", "Illinois"], correctAnswer: "Minnesota"))
//        quiz.append(Quiz(image: "MS", answers: ["Mississippi", "Arkansas", "Louisiana", "Alabama"], correctAnswer: "Mississippi"))
//        quiz.append(Quiz(image: "MO", answers: ["Missouri", "Arkansas", "Illinois", "Indiana"], correctAnswer: "Missouri"))
//        quiz.append(Quiz(image: "MT", answers: ["Montana", "Oregon", "Idaho", "Washington"], correctAnswer: "Montana"))
//        quiz.append(Quiz(image: "NE", answers: ["Nebraska", "South Dakota", "Kansas", "Colorado"], correctAnswer: "Nebraska"))
//        quiz.append(Quiz(image: "NV", answers: ["Nevada", "Arizona", "Utah", "Oregon"], correctAnswer: "Nevada"))
        
        quiz.append(Quiz(image: "NH", answers: ["New Hampshire", "Vermont", "Maine", "Massachusetts"], correctAnswer: "New Hampshire"))
        quiz.append(Quiz(image: "NJ", answers: ["New Jersey", "New York", "New Hampshire", "New Mexico"], correctAnswer: "New Jersey"))
        
        
//        quiz.append(Quiz(image: "NM", answers: ["New Mexico", "Arizona", "Colorado", "Utah"], correctAnswer: "New Mexico"))
//        quiz.append(Quiz(image: "NY", answers: ["New York", "New Jersey", "Delaware", "Pennsylvania"], correctAnswer: "New York"))
//        quiz.append(Quiz(image: "NC", answers: ["North Carolina", "Virginia", "South Carolina", "Georgia"], correctAnswer: "North Carolina"))
//        quiz.append(Quiz(image: "ND", answers: ["North Dakota", "Nebraska", "Montana", "Wyoming"], correctAnswer: "North Dakota"))
//        quiz.append(Quiz(image: "OH", answers: ["Ohio", "West Virginia", "Indiana", "Michigan"], correctAnswer: "Ohio"))
//        quiz.append(Quiz(image: "OK", answers: ["Oklahoma", "Kansas", "Arkansas", "Louisiana"], correctAnswer: "Oklahoma"))
//        quiz.append(Quiz(image: "OR", answers: ["Oregon", "Idaho", "Nevada", "Utah"], correctAnswer: "Oregon"))
//        quiz.append(Quiz(image: "PA", answers: ["Pennsylvania", "New York", "Maryland", "Ohio"], correctAnswer: "Pennsylvania"))
        
        
        quiz.append(Quiz(image: "RI", answers: ["Rhode Island", "Connecticut", "Massachusetts", "New York"], correctAnswer: "Rhode Island"))
        
        
//        quiz.append(Quiz(image: "SC", answers: ["South Carolina", "North Carolina", "Virginia", "Tennessee"], correctAnswer: "South Carolina"))
//        quiz.append(Quiz(image: "SD", answers: ["South Dakota", "Nebraska", "Wyoming", "Iowa"], correctAnswer: "South Dakota"))
//        quiz.append(Quiz(image: "TN", answers: ["Tennessee", "Kentucky", "Virginia", "North Carolina"], correctAnswer: "Tennessee"))
//        quiz.append(Quiz(image: "TX", answers: ["Texas", "Alaska", "Florida", "New Mexico"], correctAnswer: "Texas"))
//        quiz.append(Quiz(image: "UT", answers: ["Utah", "Nevada", "Wyoming", "Iowa"], correctAnswer: "Utah"))
        
        
        quiz.append(Quiz(image: "VT", answers: ["Vermont", "New Hampshire", "New Jersey", "Maine"], correctAnswer: "Vermont"))
        
        
        //!quiz.append(Quiz(image: "VA", answers: ["Virginia", "Maryland", "Kentucky", "North Carolina"], correctAnswer: "Virginia"))
        //!quiz.append(Quiz(image: "WA", answers: ["Washington", "Oregon", "Montana", "Alaska"], correctAnswer: "Washington"))
        
        
        quiz.append(Quiz(image: "WV", answers: ["West Virginia", "Virginia", "Ohio", "Indiana"], correctAnswer: "West Virginia"))
        
        
        
//        quiz.append(Quiz(image: "WI", answers: ["Wisconsin", "Michigan", "Minnesota", "Illinois"], correctAnswer: "Wisconsin"))
//        quiz.append(Quiz(image: "WY", answers: ["Wyoming", "Nebraska", "Colorado", "Utah"], correctAnswer: "Wyoming"))
        
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
