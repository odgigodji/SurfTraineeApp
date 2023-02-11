//
//  DataManager.swift
//  mvSurfTraineeAppp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation

protocol DataManager {
    func getTraineeDirections() -> [String]
}

class DataManagerImpl: DataManager {
    
    func getTraineeDirections() -> [String] {
        
        let traineeDirections = ["IOS", "Android", "Design", "QA", "Flutter", "PM", "Devops", "Backend", "Machine Learning", "Game Dev"]
        
        return traineeDirections
    }
}
