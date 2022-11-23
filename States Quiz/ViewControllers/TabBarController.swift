//
//  ViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    
    #warning("Change icons")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = UINavigationController(rootViewController: MenuViewController())
       // let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        let historyVC = UINavigationController(rootViewController: GameViewController())
                
        menuVC.tabBarItem.image = UIImage(systemName: "list.bullet")
        menuVC.tabBarItem.title = "Games"
        //settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        //settingsVC.tabBarItem.title = "Settings"
        historyVC.tabBarItem.image = UIImage(systemName: "list.star")
        historyVC.tabBarItem.title = "History"
        
        setViewControllers([menuVC, historyVC], animated: true)
    }
}

