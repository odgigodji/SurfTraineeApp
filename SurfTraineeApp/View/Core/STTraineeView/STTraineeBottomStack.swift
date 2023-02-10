//
//  STTraineeBottomStack.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit

final class STTraineeBottomStack: UIStackView {
    
//    var topLabel = STLabel(text: "Стажировка в Surf", font: STFonts.bold24, textColor: .black)
    var label = STLabel(text: "Получай стипендию, выстраивай удобный график, работай на современном железе.", font: STFonts.regular14, textColor: .gray)
    private var twoRowCollectionView = STTwoRowCollectionView()
    
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

//        backgroundColor = .green
        
        addArrangedSubview(label)
        addArrangedSubview(twoRowCollectionView)
        
        NSLayoutConstraint.activate([
            twoRowCollectionView.heightAnchor.constraint(equalToConstant: 101)
        ])
    }
}
