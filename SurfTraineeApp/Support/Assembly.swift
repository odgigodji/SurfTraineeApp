//
//  Assembly.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 12.02.23.
//

import UIKit

class STMainAssembly {
    
    var view                = STMainViewController()
    let presenter           = STMainPresenter()
    let dataManager         = DataManagerImpl()
    
    func createMainPresenter() {
        view.output                 = presenter
        
        presenter.view              = view
        presenter.dataManager       = dataManager
    }
}
