//
//  STCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

class STCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

//    let cells = ["ios", "android", "pm"]
    let cells = [STButton(type: .regular, title: "IOS"), STButton(type: .regular, title: "Android"), STButton(title: "Design"), STButton(title: "QA")] + [STButton(type: .regular, title: "PM"), STButton(type: .regular, title: "UX"), STButton(title: "UI"), STButton(title: "Test")]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .green
        delegate = self
        dataSource = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: STCollectionViewCell.id, for: indexPath) as! STCollectionViewCell
        
        cell.button = cells[indexPath.row]
        cell.configureButton()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //MARK: - height and width cell in collecitonView
        return CGSize(width: 71, height: 44)
    }
    

}
