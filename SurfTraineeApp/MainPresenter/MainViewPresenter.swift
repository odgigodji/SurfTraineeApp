//
//  MainPresenter.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation


//D - Dependensy injection
//связи верхнего уровня не зависят от связей нижнего уровня, связываться с протоколами

class MainViewPresenter: PresenterOutput {
    
    
    weak var view: PresenterInput!
    var dataManager: DataManager!
    
    func didPressedAction() {
        
        let traineeDirections = dataManager.getTraineeDirections()
//        view.showNumbers(numbers)
    }
    
//    func updateDataManger() {
//        dataManager.numbers = [6, 7, 8, 9, 10]
//    }
    
}
