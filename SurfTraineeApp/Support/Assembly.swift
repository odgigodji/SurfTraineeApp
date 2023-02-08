//
//  Assembly.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

//сборка проходит раньше чем зашрузиться вью контроллер
class MainAssembly {
    
    var view                = STMainViewController()
    let presenter           = MainViewPresenter()
    let dataManager         = DataManagerImpl()
    
    func createMainPresenter() {
        view.output             = presenter
        
        presenter.view          = view
        presenter.dataManager   = dataManager
    }
    
}
