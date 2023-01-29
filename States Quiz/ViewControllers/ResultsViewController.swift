//
//  GameHistoryViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 23.11.2022.
//

import UIKit
import CoreData
import SnapKit

class ResultsViewController: UIViewController {
    
    private let resultsTableView = UITableView()
    private let messageLable = UILabel()
    private let resultModel = ResultModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        navigationItem.title = "Results"
        view.backgroundColor = .systemBackground
        
        setupClearButton()
        setupResults()
        setupMessageLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultModel.fetchResults(tableView: resultsTableView)
        messageLable.alpha = ResultModel.results.count > 0 ? 0 : 1
    }
    
    private func setupResults() {
        
        view.addSubview(resultsTableView)
        
        resultsTableView.allowsSelection = false
        
        resultsTableView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(UIDevice.current.userInterfaceIdiom == .pad ? 0.7 : 1)
        }
    }
    
    private func setupClearButton() {
        
        let clear = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearAction))
        navigationItem.rightBarButtonItem = clear
    }
    
    @objc private func clearAction() {

        if !ResultModel.results.isEmpty {
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete all your results?", preferredStyle: .alert)
            
            let delete = UIAlertAction(title: "Delete", style: .destructive) { _ in
                self.resultModel.clearResults(tableView: self.resultsTableView)
                self.messageLable.alpha = 1
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(delete)
            alert.addAction(cancel)
            
            present(alert, animated: true)
        }
    }

    private func setupMessageLabel() {
        
        view.addSubview(messageLable)
        
        messageLable.text = "Here you will see the results of your games"
        messageLable.numberOfLines = 0
        messageLable.textColor = .lightGray
        
        messageLable.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResultModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = resultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? ResultTableViewCell {
            cell.setupCell(resultToDisplay: ResultModel.results[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, complitionHandler in
            self.resultModel.removeResult(resultId: indexPath.row, tableView: self.resultsTableView)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
