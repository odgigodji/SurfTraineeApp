//
//  STCollectionViewCell.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

class STCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    let myView = STButton(title: "IOS_FLUTTER")
    
    static let id = "STCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//           heightAnchor.constraint(equalToConstant: 200)
//        ])
//
        configuremyView()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        myView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "her"
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: myView.trailingAnchor),
            label.topAnchor.constraint(equalTo: myView.topAnchor),
            label.bottomAnchor.constraint(equalTo: myView.bottomAnchor)
        ])
    }
    
    func configuremyView() {
        addSubview(myView)
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myView.topAnchor.constraint(equalTo: topAnchor),
            myView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
