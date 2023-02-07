//
//  ViewController.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import UIKit

class MainVC: UIViewController {

    lazy var label = UILabel(frame: CGRect(x: Int(view.bounds.width / 2 - 100), y: Int(view.bounds.height / 2 - 250), width: 200, height: 100))
    
    lazy var button = UIButton(frame: CGRect(x: Int(view.bounds.width / 2 - 100), y: Int(view.bounds.height / 2 + 50), width: 200, height: 100))
    
    
    var output: PresenterOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        configureLabel()
        configureButton()
    }

    func configureLabel() {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 45)
        label.text = "hello"
        label.backgroundColor = .yellow
    }
    
    func configureButton() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont(name: "Academy Engraved LET Plain:1.0", size: 45)
        
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Tap me!", for: .normal)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        output.didPressedAction()
    }
    
}

//MARK: - Input
extension MainVC: PresenterInput {
    func showNumbers(_ numbers: [Int]) {
        let numbersString = numbers.map({"\($0)"}).joined(separator: ",")
        label.text = numbersString
    }
}
