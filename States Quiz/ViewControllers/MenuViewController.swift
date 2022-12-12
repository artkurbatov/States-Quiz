//
//  MenuViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    #warning("Add table view to display different game modes")
    
    private var gameModeTableView = UITableView()
    
    private var appState = ApplicationState()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Let's play"
        gameModeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "gameModeCell")
        
        gameModeTableView.delegate = self
        gameModeTableView.dataSource = self
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        
        view.addSubview(gameModeTableView)
        gameModeTableView.showsVerticalScrollIndicator = false
        
        gameModeTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appState.gameMods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameModeTableView.dequeueReusableCell(withIdentifier: "gameModeCell", for: indexPath)
        cell.textLabel?.text = appState.gameMods[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = GameViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
