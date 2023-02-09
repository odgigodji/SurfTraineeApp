//
//  STLabel.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

class STLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .left
    }
    
    convenience init(text: String, font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text       = text
        self.font       = font
        self.textColor  = textColor
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
