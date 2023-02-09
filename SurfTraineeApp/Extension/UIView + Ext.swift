//
//  UIView + Ext.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

extension UIView {
    
    func arrange(on superView: UIView, top: CGFloat?, leading: CGFloat?, trailing: CGFloat?, bottom: CGFloat?, height: CGFloat?, width: CGFloat?) {
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top ?? 0),
            self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            self.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: width ?? 0),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom ?? 0),
            self.heightAnchor.constraint(equalToConstant: height ?? 0)
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views { self.addSubview(view) }
    }
}

