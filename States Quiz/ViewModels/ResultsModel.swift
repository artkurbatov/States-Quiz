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
    var results = [Result]()
    
    func fetchResults(tableView resultsTableView: UITableView) {
        
        do {
            self.results = try context.fetch(Result.fetchRequest())
            
            DispatchQueue.main.async {
                resultsTableView.reloadData()
            }
        }
        catch {
#warning("add error handler")
        }
    }
    
    func addResult(gameTitle: String, score: String, attemptsLeft: Int) {
        
        let result = Result(context: self.context)
        result.gameTitle = gameTitle
        result.score = score
        result.attemptsLeft = Int64(attemptsLeft)
        
        do {
            try self.context.save()
        }
        catch {
#warning("add error handler")
        }
    }
    
    
    func removeResult(resultId: Int, tableView resultsTableView: UITableView) {
        
        self.context.delete(results[resultId])
        
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        fetchResults(tableView: resultsTableView)
    }
    
    
}
