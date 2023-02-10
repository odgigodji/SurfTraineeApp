//
//  STTraineeTopStackView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

final class STTraineeTopStackView: UIStackView {
    
    var topLabel = STLabel(text: "Стажировка в Surf", font: STFonts.bold24, textColor: .black)
    var middleLabel = STLabel(text: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды.", font: STFonts.regular14, textColor: .gray)
    private var collectionView = STCollectionView()
    
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
        distribution    = .fillEqually
        spacing         = 12
       
        addArrangedSubview(topLabel)
        addArrangedSubview(middleLabel)
        addArrangedSubview(collectionView)
    }
}
