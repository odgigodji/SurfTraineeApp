//
//  STInfinityCollectionViewModel.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 11.02.23.
//

import Foundation


final class STInfinityCollectionViewModel: STCollectionViewModelProtocol {
    
    private var dataManager : DataManager           = DataManagerImpl()
    private var minCountOfCollectionViewCells : Int = 16
    
    func createButtonsWithTraineeDirections() -> [STButton] {
        var traineeDirections = dataManager.getTraineeDirections()
        if traineeDirections.count < minCountOfCollectionViewCells {
           traineeDirections = modifyArrayOfStringToPossibleCount(traineeDirections)
        }
        
        let buttons = traineeDirections.map { STButton(title: $0) }
        return buttons
    }
    
    private func modifyArrayOfStringToPossibleCount(_ arrayOfString: [String]) -> [String] {
        var modifiedArray = arrayOfString
        for _ in 0...minCountOfCollectionViewCells {
            if modifiedArray.count >= minCountOfCollectionViewCells { break }
            modifiedArray += modifiedArray
        }
        return modifiedArray
    }
}
