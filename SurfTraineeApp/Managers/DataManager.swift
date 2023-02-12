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

/// Imitation of Data Manager
final class DataManagerImpl: DataManager {
    
    func getTraineeDirections() -> [String] {
        
        let traineeDirections = ["IOS"]
        
        return traineeDirections
    }
}
