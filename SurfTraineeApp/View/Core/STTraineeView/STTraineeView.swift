//
//  STTraineeView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 08.02.23.
//

import UIKit


/// Content View
final class STTraineeView: UIView {

    private let topStackView    = STTraineeTopStackView()
    private let bottomStackView = STTraineeBottomStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(topStackView, bottomStackView)
        
        configureTopStackView()
        configureBottomStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure
    private func configureTopStackView() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configureBottomStackView() {
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 24),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: - Set
    func set(traineeDirections: [String]) {
        topStackView.set(traineeDirections: traineeDirections)
        bottomStackView.set(traineeDirections: traineeDirections)
    }
}
