//
//  STTraineeBottomStack.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit

final class STTraineeBottomStack: UIStackView {
    
    private let label                   = STLabel(text: STText.secondary2, font: STFonts.regular14, textColor: .gray)
    private var twoRowCollectionView    = STTwoRowVerticalCollectionView()
    
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
        
        addArrangedSubview(label)
        addArrangedSubview(twoRowCollectionView)
        
        let padding: CGFloat = 13
        let heightConstant = (STFrameConstants.heightOfCollectionViewCell * 2) + padding
        NSLayoutConstraint.activate([
            twoRowCollectionView.heightAnchor.constraint(equalToConstant: heightConstant)
        ])
    }
    
    //MARK: - Set
    func set(traineeDirections: [String]) {
        twoRowCollectionView.set(traineeDirections: traineeDirections)
    }
}
