//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit


/// Content View
final class STTraineeView: UIView {

    var topStackView = STTraineeTopStackView()
    var bottomStackView = STMainBottomStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubviews(topLabel, middleLabel, collectionView)
        
//        configureTopLabel()
//        configureMiddleLabel()
//        configureCollectionView()
        addSubviews(topStackView)
        
        configureTopStackView()
//        configureBottomStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private
//    private func configureTopLabel() {
//        NSLayoutConstraint.activate([
//            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
//            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
//        ])
//    }
//
//    private func configureMiddleLabel() {
//        NSLayoutConstraint.activate([
//            middleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 12),
//            middleLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
//            middleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
//        ])
//    }
//
//    private func configureCollectionView() {
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            collectionView.topAnchor.constraint(equalTo: middleLabel.bottomAnchor, constant: 12),
//
//            collectionView.heightAnchor.constraint(equalToConstant: 44)
//        ])
//    }
    
    private func configureTopStackView() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func configureBottomStackView() {
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 24),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
