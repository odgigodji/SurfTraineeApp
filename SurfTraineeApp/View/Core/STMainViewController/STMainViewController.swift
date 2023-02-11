//
//  STMainViewController.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

protocol ShowAlertProtocol {
    func showSuccessAlert()
}

final class STMainViewController: UIViewController {
    
    private var imageView   = UIImageView(image: UIImage(named: "background"))
    private var scrollView  = UIScrollView()
    private var contentView = STTraineeView(frame: .zero)
    private var bottomStackView = STMainBottomStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(imageView, scrollView)
        
        configureImageView()
        configureScrollView()
        configureContentView()
        
        configureBottomStackView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimattion()
    }
    
    //MARK: - Private
    
    //MARK: - Configure Layout
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
    
    private func configureContentView() {
        scrollView.addSubview(contentView)
        contentView.backgroundColor                             = .white
        contentView.layer.cornerRadius                          = 32
        
        NSLayoutConstraint.activate([
            
            //FIXME: - constant
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
    private func configureBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.delegate = self
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    //MARK: - Animations
    private func prepareAnimation() {
        self.contentView.alpha = 0.0
        self.bottomStackView.alpha = 0.0
    }
    
    private func startAnimattion() {
        UIView.animate(withDuration: 1) {
            self.contentView.alpha = 1.0
        }
        UIView.animate(withDuration: 2) {
            self.bottomStackView.alpha = 1.0
        }
    }
    
}

extension STMainViewController: ShowAlertProtocol {
    func showSuccessAlert() {
        self.presentAlertOnMainThread(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", buttonTitle: "Закрыть")
    }
}
