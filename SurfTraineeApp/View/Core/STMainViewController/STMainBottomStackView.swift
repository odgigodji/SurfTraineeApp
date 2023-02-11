//
//  STMainBottomView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


final class STMainBottomStackView: UIStackView {
    
    weak var delegate: STMainViewController?
    
    private var sendAnApplicationButton = STButton(type: .big, title: "Отправить заявку")
    private var label = STLabel(text: "Xочешь к нам?", font: STFonts.regular14, textColor: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        configureStackView()
        sendAnApplicationButton.addTarget(self, action: #selector(sendAnApplicationButtonTapped), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private
    private func configureStackView() {
        axis            = .horizontal
        distribution    = .fillProportionally
       
        addArrangedSubview(label)
        addArrangedSubview(sendAnApplicationButton)
    }
    
    @objc private func sendAnApplicationButtonTapped() {
        delegate?.showSuccessAlert()
    }
}
