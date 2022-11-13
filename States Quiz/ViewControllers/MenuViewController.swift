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
    
    private var playButton = UIButton()
    private var gameModeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        
        //gameModeTableView.delegate = self
        //gameModeTableView.dataSource = self
        
        setUpButton()
    }
            
    private func setUpButton() {
        
        view.addSubview(playButton)
        
        playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        playButton.imageView?.tintColor = .systemGreen

        playButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        playButton.imageView?.snp.makeConstraints({ make in
            make.height.width.equalTo(100)
        })
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    @objc private func playButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}

//extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
