//
//  UIView + Ext.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit


extension UIView {
    
/// extension for adding subViews on superview
/// - Parameter views: subviews
    func addSubviews(_ views: UIView...) {
        for view in views { self.addSubview(view) }
    }
}

