//
//  GameModeModel.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 12.12.2022.
//

import Foundation

class ApplicationState {
    
    static let shared = ApplicationState()
    
    var didLaunchBefore = false
    
    func saveStatus() {
        
        if let encoded = try? JSONEncoder().encode(didLaunchBefore) {
            UserDefaults.standard.set(encoded, forKey: "appStatus")
        }
    }
    
    func getStatus() {
        if let data = UserDefaults.standard.data(forKey: "appStatus") {
            
            if let decoded = try? JSONDecoder().decode(Bool.self, from: data) {
                didLaunchBefore = decoded
            }
        }
    }
}
