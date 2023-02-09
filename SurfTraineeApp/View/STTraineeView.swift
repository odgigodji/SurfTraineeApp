//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

class STTraineeView: UIView {

    var whiteView = UIView()
    var label = UILabel()
    
    private var collectionView = STCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        configureImageView()
        configureMainView()
        configureLabel()
        configureCollectionView()
        
//        NSLayoutConstraint.activate([
//            heightAnchor.constraint(equalToConstant: 1000),
//            widthAnchor.constraint(equalToConstant: bounds.width)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureMainView() {
        addSubview(whiteView)
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        whiteView.backgroundColor = .white
        whiteView.layer.masksToBounds = true
        whiteView.layer.cornerRadius = 32
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            whiteView.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            whiteView.widthAnchor.constraint(equalTo: widthAnchor),
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor)
        ])
        
        label.font =  Fonts.bold24
        label.text = "Cтажировка в Surf"
    }
    
    func configureCollectionView() {
        whiteView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
}
