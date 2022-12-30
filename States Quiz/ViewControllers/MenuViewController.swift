//
//  MenuViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 04.11.2022.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {

    private var gameModeTableView = UITableView()
    
    private var appState = ApplicationState()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Let's play"
        gameModeTableView.register(GameModeTableViewCell.self, forCellReuseIdentifier: "gameModeCell")
        
        gameModeTableView.delegate = self
        gameModeTableView.dataSource = self
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        
        view.addSubview(gameModeTableView)
        
        gameModeTableView.separatorStyle = .none
        gameModeTableView.showsVerticalScrollIndicator = false
        
        gameModeTableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appState.gameMods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = gameModeTableView.dequeueReusableCell(withIdentifier: "gameModeCell", for: indexPath) as? GameModeTableViewCell {
            cell.textLabel?.text = appState.gameMods[indexPath.row]
            cell.configureCell()
            cell.selectionStyle = .none
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.1
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = GameViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
