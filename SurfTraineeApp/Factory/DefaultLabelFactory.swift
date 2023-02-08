//
//  DefaultLabelFactory.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

enum DefaultLabels {
    case okAlert
    case cancelAlert
    case unexpectedErrorAlert
}

protocol DefaultLabelsFactory: AnyObject {
   
    func getAlert(by type: DefaultLabels) -> UIViewController
}

class DefaultLabelsFactoryImpl :DefaultLabelsFactory {
    
    func getAlert(by type: DefaultLabels) -> UIViewController {
        switch type {
        case .okAlert               : return configureOkAlert()
        case .cancelAlert           : return configureCancelAlert()
        case .unexpectedErrorAlert  : return configureUnexpectedErrorAlert()
        }
    }
    
    //alerts are viewcontrollers
    private func configureOkAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "ok", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        return alertController
    }
    
    
    private func configureCancelAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Cancel", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        return alertController
    }
    
    
    private func configureUnexpectedErrorAlert() -> UIViewController {
        let alertController = UIAlertController(title: nil, message: "Unexpected error", preferredStyle: .alert)
        let action = UIAlertAction(title: "Unexpected error", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        return alertController
    }
}
