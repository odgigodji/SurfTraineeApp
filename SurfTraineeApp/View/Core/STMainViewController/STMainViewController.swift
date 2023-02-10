//
//  STMainViewController.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

final class STMainViewController: UIViewController {
    
    private var imageView   = UIImageView(image: UIImage(named: "background"))
    private var scrollView  = UIScrollView()
    private var contentView = STTraineeView(frame: .zero)
    
//    private var button = STButton(type: .big, title: "Отправить заявку")
    private var bottomView = STMainBottomStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(imageView, scrollView)
        
        configureImageView()
        configureScrollView()
        configureMainView()
        
        configureBottomView()
    }
    
    //MARK: - Private
    private func getTraineeDirections() {
//        output.getTraineeDirections()
    }
    
    /// Layout UI
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
            //FIXME: - constant
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
    private func configureBottomView() {
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            bottomView.widthAnchor.constraint(equalToConstant: 219),
//            bottomView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}


