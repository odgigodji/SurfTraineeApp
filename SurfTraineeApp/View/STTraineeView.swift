//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

class STTraineeView: UIView {

    var label = UILabel()
    
    private var collectionView = STCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        configureLabel()
        configureCollectionView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        label.font =  Fonts.bold24
        label.text = "Cтажировка в Surf"
    }
    
    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}
