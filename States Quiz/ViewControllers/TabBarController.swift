//
//  ViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let model = ContentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = model.createTab(rootview: MenuViewController(), title: "Games", image: "list.bullet")
        let historyVC = model.createTab(rootview: GameHistoryViewController(), title: "History", image: "list.star")
        
        setViewControllers([menuVC, historyVC], animated: true)
    }
}

