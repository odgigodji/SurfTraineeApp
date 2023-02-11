//
//  STCollectionViewCell.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

class STCollectionViewCell: UICollectionViewCell {
    
    var button : STButton?
    
    static let id = "STCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
//        layer.cornerRadius = 32
//        backgroundColor = .white
//        self.translatesAutoresizingMaskIntoConstraints = false
        
//        print("BUTTON \(button.titleLabel?.text)")
//        configureButton()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton() {
        guard let button = button else { return }
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
