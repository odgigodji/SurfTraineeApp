//
//  DataManager.swift
//  mvSurfTraineeAppp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation

protocol DataManager {
    var numbers: [Int] {get set}
    func obtainNumbers() -> [Int]
}

class DataManagerImpl: DataManager {
    
    var numbers: [Int] = [1, 2, 3, 4, 5]
    
    func obtainNumbers() -> [Int] {
        
//        return [1, 2, 3, 4, 5]
        return numbers
    }
}
