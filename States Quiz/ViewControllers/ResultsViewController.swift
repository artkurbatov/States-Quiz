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
    private let clearButton = UIButton()
    private let resultsLable = UILabel()
    private let messageLable = UILabel()
    private let resultModel = ResultModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        //navigationItem.title = "Results"
        view.backgroundColor = .systemBackground
        
        setUpClearButton()
        setUpResults()
        //setUpClearButton()
        setUpMessageLabel()
        setUpResultsLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultModel.fetchResults(tableView: resultsTableView)
        messageLable.alpha = ResultModel.results.count > 0 ? 0 : 1
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpResults() {
        
        view.addSubview(resultsTableView)
        
        resultsTableView.allowsSelection = false
        
        resultsTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            //make.bottom.equalTo(clearButton.snp.top).offset(-10)
        }
    }
    
    private func setUpClearButton() {
        
        let clear = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearAction))
        navigationItem.rightBarButtonItem = clear
    }
    
    @objc private func clearAction() {
        resultModel.clearResults(tableView: resultsTableView)
        messageLable.alpha = 1
    }
    
    private func setUpResultsLabel() {
        
        view.addSubview(resultsLable)
        
        resultsLable.text = "Results"
        resultsLable.textColor = .black // fix color
        resultsLable.font = UIFont.boldSystemFont(ofSize: 35)
        
        resultsLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.top.equalToSuperview().offset(100)
        }
        
    }
    
//    private func setUpClearButton() {
//
//        view.addSubview(clearButton)
//        clearButton.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
//
//        clearButton.configuration = .filled()
//        clearButton.configuration?.cornerStyle = .capsule
//        clearButton.configuration?.title = "Clear"
//        clearButton.configuration?.baseForegroundColor = .white
//        clearButton.configuration?.baseBackgroundColor = .systemRed
//
//        clearButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview().multipliedBy(0.3)
//            make.height.equalTo(40)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
//        }
//    }
//
//    @objc private func clearButtonAction() {
//        resultModel.clearResults(tableView: resultsTableView)
//        messageLable.alpha = 1
//    }
    
    private func setUpMessageLabel() {
        
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
            cell.setUpCell(resultToDisplay: ResultModel.results[indexPath.row])
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
