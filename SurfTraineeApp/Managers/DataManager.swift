//
//  DataManager.swift
//  mvSurfTraineeAppp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation

protocol DataManager {
    var traineeDirections: [String] {get set}
    func getTraineeDirections() -> [String]
}

class DataManagerImpl: DataManager {
    var traineeDirections = [String]()
    
    func getTraineeDirections() -> [String] {
        
        let traineeDirestions = ["IOS", "Android", "Design", "Flutter", " QA", "PM", "Devops", "Backend", "Machine Learning", "Game Dev"]
        return traineeDirestions
    }
}
