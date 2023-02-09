//
//  STButton.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


/// custom Button uses in application
class STButton: UIButton {
    
    var viewModel = STButtonViewModel()

    var pressState = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints   = false
        isUserInteractionEnabled                    = false
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
    
    private func bindViewModel() {
        viewModel.pressState?.bind { button in
            DispatchQueue.main.async { [weak self] in
                self?.didPressStateChanged()
            }
        }
    }
    
    func didPressStateChanged() {
        backgroundColor = .yellow
        setTitleColor(.red, for: .normal)
    }
    
    
    //MARK: - Private
    /// Layout UI
    func configureBigButton() {
        titleLabel?.font = STFonts.medium16
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 30
        backgroundColor = STColors.coal
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    func configureRegularButton() {
        titleLabel?.font = STFonts.medium14
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 12
        backgroundColor = STColors.lightGray
        
//        sizeToFit()
//        NSLayoutConstraint.activate([
//            heightAnchor.constraint(equalToConstant: 60),
//            widthAnchor.constraint(equalToConstant: 100)
//        ])
        
//        print("WIDTH \(frame.width)")
        
//        NSLayoutConstraint.activate([
//            FIXME: - dynamic width
//            heightAnchor.constraint(equalToConstant: 44),
//            widthAnchor.constraint(equalToConstant: 100)
//        ])
    }

}
