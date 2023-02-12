//
//  STButton.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

/// custom Button uses in application
final class STButton: UIButton {
    
    private var isPressed = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: STButtonType = .regular, title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        
        switch type {
        case .big:
            configureBigButton()
        case .regular:
            configureRegularButton()
        }
    }

    //MARK: - Action
    func didPress() {
        isPressed = !isPressed
        didPressStateChanged()
    }
    
    private func didPressStateChanged() {
        if isPressed {
            backgroundColor = STColors.coal
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = STColors.lightGray
            setTitleColor(.black, for: .normal)
        }
    }
    
    // MARK: - Configuration
    private func configureBigButton() {
        titleLabel?.font = STFonts.medium16
        setTitleColor(.white, for: .normal)
        layer.cornerRadius          = 30
        backgroundColor             = STColors.coal
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    private func configureRegularButton() {
        titleLabel?.font = STFonts.medium14
        setTitleColor(.black, for: .normal)
        layer.cornerRadius          = 12
        backgroundColor             = STColors.lightGray
        isUserInteractionEnabled    = false
        
        sizeToFit()
    }

}
