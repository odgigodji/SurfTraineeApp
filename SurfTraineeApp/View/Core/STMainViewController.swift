//
//  STMainViewController.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

final class STMainViewController: UIViewController {
    
    var output: PresenterOutput!
    
    private var imageView   = UIImageView(image: UIImage(named: "background"))
    private var scrollView  = UIScrollView()
    private var contentView = STTraineeView(frame: .zero)
    
//    private var button = STButton(type: .big, title: "Отправить заявку")
    private var bottomView = STBottomStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(imageView, scrollView)
        
        configureImageView()
        configureScrollView()
        configureMainView()
        
        configureButton()
    }
    
    //MARK: - Private
    
    private func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints    = false
        scrollView.bounces                                      = false
        scrollView.showsVerticalScrollIndicator                 = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureMainView() {
        scrollView.addSubview(contentView)
        contentView.backgroundColor                             = .white
        contentView.layer.cornerRadius                          = 32
        
//        let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets.top
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 500),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
    private func configureButton() {
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            bottomView.widthAnchor.constraint(equalToConstant: 219),
//            bottomView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

//MARK: - Input
extension STMainViewController: PresenterInput {
    func showNumbers(_ numbers: [Int]) {
//        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
//        label.text = numbersString
    }
}