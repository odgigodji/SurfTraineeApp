//
//  STTraineeBottomStack.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit

final class STTraineeBottomStack: UIStackView {
    
    var label = STLabel(text: STText.secondary2, font: STFonts.regular14, textColor: .gray)
    private var twoRowCollectionView = STTwoRowVerticalCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private
    private func configureStackView() {
        axis            = .vertical
        distribution    = .fillProportionally
        spacing         = 12
        
        addArrangedSubview(label)
        addArrangedSubview(twoRowCollectionView)
        
        let heightConstant = STFrameConstants.heightOfCollectionViewCell * 2 + 13
        
        NSLayoutConstraint.activate([
            twoRowCollectionView.heightAnchor.constraint(equalToConstant: heightConstant)
        ])
    }
}
