//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit

class STTraineeView: UIView {

    var imageView = UIImageView(image: UIImage(named: "background"))
    var whiteView = UIView()
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
        configureMainView()
        configureLabel()
        
//        NSLayoutConstraint.activate([
//            heightAnchor.constraint(equalToConstant: 1000),
//            widthAnchor.constraint(equalToConstant: bounds.width)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureMainView() {
        addSubview(whiteView)
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        whiteView.backgroundColor = .white
        whiteView.layer.masksToBounds = true
        whiteView.layer.cornerRadius = 32
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -100),
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
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
//        label.font = UIFont.systemFont(ofSize: 32)
//        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.font =  Fonts.bold24
        label.text = "Cтажировка в Surf"
    }
}
