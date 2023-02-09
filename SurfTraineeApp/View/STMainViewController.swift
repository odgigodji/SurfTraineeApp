//
//  STMainViewController.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

class STMainViewController: UIViewController {
    
    var output: PresenterOutput!
    
    var scrollView = UIScrollView()
    
    var contentView = STTraineeView(frame: .zero)
    
    var imageView = UIImageView(image: UIImage(named: "background"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view = contentView
//        view.backgroundColor = .systemPink

        configureImageView()
        configureScrollView()
        configureMainView()
        
//        configureLabel()
//        configureButton()
    }
    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    func configureMainView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 32

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 500),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: view.frame.height - 10)
            
            
//            mainView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -100),
//             mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//             mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//             mainView.heightAnchor.constraint(equalToConstant: 1500)
        ])
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
//        scrollView.alpha = 0.5
//        scrollView.contentOffset.y = -view.bounds.height
//        scrollView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
//
//    func configureLabel() {
//        view.addSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 45)
//        label.text = "hello"
//        label.backgroundColor = .yellow
//    }
//
//    func configureButton() {
//        view.addSubview(button)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .blue
//        button.titleLabel?.font = UIFont(name: "Academy Engraved LET Plain:1.0", size: 45)
//
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("Tap me!", for: .normal)
//
//        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
//    }
//
//    @objc func tapButton() {
//        output.didPressedAction()
//    }
    
}

//MARK: - Input
extension STMainViewController: PresenterInput {
    func showNumbers(_ numbers: [Int]) {
//        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
//        label.text = numbersString
    }
}
