//
//  STButton.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


/// custom Button uses in application
class STButton: UIButton {

    private var pressState = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: STButtonType, title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        
        switch type {
        case .big:
            configureBigButton()
        case .regular:
            configureRegularButton()
        }
    }
    
    func configureBigButton() {
        titleLabel?.font = STFonts.medium16
        titleLabel?.textColor = .white
        layer.cornerRadius = 32
//        self.backgroundColor = UIColor.systemGray6
        self.backgroundColor = UIColor.black
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    func configureRegularButton() {
        titleLabel?.font = STFonts.medium14
    }

}
