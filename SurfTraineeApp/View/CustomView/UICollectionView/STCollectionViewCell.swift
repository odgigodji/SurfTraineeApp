//
//  STCollectionViewCell.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

class STCollectionViewCell: UICollectionViewCell {
    
    let button = STButton(title: "IOS_FLUTTER")
    
    static let id = "STCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
//        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton() {
        addSubview(button)
//        layer.cornerRadius = 32
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
