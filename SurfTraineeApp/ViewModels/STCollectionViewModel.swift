//
//  STCollectionViewModel.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

//protocol ObservableViewModelProtocol {
//    var articles: Dynamic<[String]> { get  set }
//}

final class STCollectionViewModel {
    var dataManager = DataManagerImpl()
    
//    var traindeeDirections = [String]()
    
    func createButtonsWithTraineeDirections() -> [STButton] {
        let traineeDirections = dataManager.getTraineeDirections()
        let buttons = traineeDirections.map { STButton(title: $0) }
        return buttons
    }
}
