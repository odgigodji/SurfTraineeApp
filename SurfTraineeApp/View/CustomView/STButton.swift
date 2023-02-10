//
//  STButton.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


/// custom Button uses in application
class STButton: UIButton {
    
//    var viewModel = STButtonViewModel()

    private var isPressed = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints   = false
        isUserInteractionEnabled                    = false
        
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: STButtonType = .regular, title: String) {
        self.init(frame: .zero)
        
        let modifiedTitle = title
        setTitle(modifiedTitle, for: .normal)
        
        switch type {
        case .big:
            configureBigButton()
        case .regular:
            configureRegularButton()
        }
    }

    func didPressed() {
        isPressed = !isPressed
        didPressStateChanged()
    }

    
    //MARK: - Private
    
    private func didPressStateChanged() {
        if isPressed {
            backgroundColor = STColors.coal
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = STColors.lightGray
            setTitleColor(.black, for: .normal)
        }
    }
    
    /// Layout UI
    private func configureBigButton() {
        titleLabel?.font = STFonts.medium16
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 30
        backgroundColor = STColors.coal
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    private func configureRegularButton() {
        titleLabel?.font = STFonts.medium14
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 12
        backgroundColor = STColors.lightGray
        
        sizeToFit()
    }
}
