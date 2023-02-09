//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit


/// Content View
final class STTraineeView: UIView {

    var topLabel = STLabel(text: "Стажировка в Surf", font: STFonts.bold24, textColor: .black)
    var middleLabel = STLabel(text: "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды", font: STFonts.regular14, textColor: .gray)
    
    private var collectionView = STCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(topLabel, middleLabel, collectionView)
        
        configureTopLabel()
        configureMiddleLabel()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private
    private func configureTopLabel() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func configureMiddleLabel() {
        NSLayoutConstraint.activate([
            middleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 12),
            middleLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            middleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    private func configureCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: middleLabel.bottomAnchor, constant: 12),
            
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
