//
//  STCollectionViewModel.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


final class STCollectionViewModel: STCollectionViewModelProtocol {
    private var dataManager = DataManagerImpl()
    
    func createButtonsWithTraineeDirections() -> [STButton] {
        let traineeDirections = dataManager.getTraineeDirections()
        let buttons = traineeDirections.map { STButton(title: $0) }
        return buttons
    }
}
