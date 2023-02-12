//
//  STTraineeTopStackView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

final class STTraineeTopStackView: UIStackView {
    
    private let topLabel        = STLabel(text: STText.mainTitle, font: STFonts.bold24, textColor: .black)
    private let middleLabel     = STLabel(text: STText.secondary1, font: STFonts.regular14, textColor: .gray)
    private let collectionView  = STInfinityHorizontalCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure
    private func configureStackView() {
        axis            = .vertical
        distribution    = .fillProportionally
        spacing         = 12
       
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: STFrameConstants.heightOfCollectionViewCell),
        ])
        
        addArrangedSubview(topLabel)
        addArrangedSubview(middleLabel)
        addArrangedSubview(collectionView)
    }
}
