//
//  STMainViewPresenter.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 12.02.23.
//

import Foundation

protocol STMainPresenterOutput: AnyObject {
    func getTraineeDirection() -> [String]
}


protocol STMainPresenterInput: AnyObject {
    func setupTraineeDirections()
}


class STMainPresenter: STMainPresenterOutput {
   
    weak var view: STMainPresenterInput!
    weak var collecitonView: STMainPresenterInput!
    
    var dataManager: DataManager!
    
    func getTraineeDirection() -> [String] {
        dataManager.getTraineeDirections()
    }
}
