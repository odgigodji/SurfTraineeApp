//
//  UIViewController + Ext.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 11.02.23.
//

import UIKit

///extension for fast show alert
extension UIViewController {
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            let action = UIAlertAction(title: "Закрыть", style: .default)
            alertVC.addAction(action)
            self.present(alertVC, animated: true)
        }
    }
}
