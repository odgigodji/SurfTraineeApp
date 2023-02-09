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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(imageView, scrollView)
        
        configureImageView()
        configureScrollView()
        configureMainView()
    }
    
    //MARK: - Private
    
    private func configureImageView() {
//        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureScrollView() {
//        view.addSubview(scrollView)
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
//        contentView.translatesAutoresizingMaskIntoConstraints   = false
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
    
}

//MARK: - Input
extension STMainViewController: PresenterInput {
    func showNumbers(_ numbers: [Int]) {
//        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
//        label.text = numbersString
    }
}
