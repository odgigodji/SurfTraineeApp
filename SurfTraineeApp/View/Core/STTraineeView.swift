//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

class STTraineeView: UIView {

    var topLabel = STLabel(text: "Стажировка в Surf", font: Fonts.bold24, textColor: .black)
    
    private var collectionView = STCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(topLabel, collectionView)
        
        configureLabel()
        configureCollectionView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLabel() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            topLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}
