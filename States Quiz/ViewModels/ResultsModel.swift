//
//  HistoryModel.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 24.11.2022.
//

import Foundation
import UIKit
import CoreData

class ResultModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var results = [Result]()
    
    func fetchResults(tableView resultsTableView: UITableView) {
        
        do {
            ResultModel.results = try context.fetch(Result.fetchRequest())
            
            DispatchQueue.main.async {
                resultsTableView.reloadData()
            }
        }
        catch {
            #warning("error handler")
        }
    }
    
    func addResult(gameTitle: String, score: String, mistakeCounter: Int) {
        
        let result = Result(context: self.context)
        result.gameTitle = gameTitle
        result.score = score
        result.mistakeCounter = Int64(mistakeCounter)
        
        do {
            try self.context.save()
        }
        catch {
#warning("error handler")
        }
    }
    
    
    func removeResult(resultId: Int, tableView resultsTableView: UITableView) {
        
        self.context.delete(ResultModel.results[resultId])
        
        do {
            try self.context.save()
        }
        catch {
#warning("error handler")
        }
        fetchResults(tableView: resultsTableView)
    }
    
    func clearResults(tableView resultsTableView: UITableView) {
        
        for result in ResultModel.results {
            self.context.delete(result)
        }
        do {
            try self.context.save()
        }
        catch {
#warning("error handler")
        }
        fetchResults(tableView: resultsTableView)
    }
    
    private func errorAlert(errorMessage: String) -> UIAlertController {
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        return alert
    }
}
