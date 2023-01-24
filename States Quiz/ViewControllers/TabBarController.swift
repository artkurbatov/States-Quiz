//
//  ViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let model = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameVC = model.createTab(rootview: GameViewController(), title: "Games", image: "gamecontroller")
        let historyVC = model.createTab(rootview: ResultsViewController(), title: "Results", image: "list.star")
        
        setViewControllers([gameVC, historyVC], animated: true)
    }
}

