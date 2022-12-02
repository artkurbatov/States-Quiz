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
    private let resultModel = ResultModel()
    //private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   // private var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        navigationItem.title = "Results"
        
        setUpResults()
        //fetchResults()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultModel.fetchResults(tableView: resultsTableView)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpResults() {
        
        view.addSubview(resultsTableView)
        
        resultsTableView.allowsSelection = false
        
        resultsTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(20)
        }
        
    }
    
    
//    private func fetchResults() {
//
//        do {
//            self.results = try context.fetch(Result.fetchRequest())
//
//            DispatchQueue.main.async {
//                self.resultsTableView.reloadData()
//            }
//        }
//        catch {
//            #warning("add error handler")
//        }
//    }
//
//    private func addResult() {
//
//        let result = Result(context: self.context)
//        result.gameTitle = "New Game"
//        result.score = "2/50"
//        result.attemptsLeft = 4
//
//        do {
//            try self.context.save()
//        }
//        catch {
//            #warning("add error handler")
//        }
//
//        self.fetchResults()
//    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        cell.textLabel?.text = resultModel.results[indexPath.row].score
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, complitionHandler in
            
            self.resultModel.removeResult(resultId: indexPath.row, tableView: self.resultsTableView)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
        
    }
}
