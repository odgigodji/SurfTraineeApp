//
//  MainPresenter.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation

class MainViewPresenter: PresenterOutput {

   
    weak var view: PresenterInput!
    var dataManager: DataManager!
    
    func getTraineeDirections() {
        let directions = dataManager.getTraineeDirections()
        view.showNumbers(directions)
    }
    
    func createButtonsWithDirections() -> [STButton] {
        let directions = dataManager.getTraineeDirections()
        return [STButton]()
    }
    
//    func didPressedAction() {
//
//        let traineeDirections = dataManager.getTraineeDirections()
//        view.showNumbers(traineeDirections)
////        view.showNumbers(numbers)
//    }
//
//    func updateDataManger() {
//        dataManager.traineeDirections = ["her ", "adsf"]
//    }
    
}
