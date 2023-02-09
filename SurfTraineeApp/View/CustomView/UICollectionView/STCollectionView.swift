//
//  STCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


class STCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - test buttons
    var cells = [STButton(type: .regular, title: "IOS"), STButton(type: .regular, title: "Androidaksdjfklasjdklfhkljh"), STButton(title: "Design"), STButton(title: "QA")] + [STButton(type: .regular, title: "PM"), STButton(type: .regular, title: "UX"), STButton(title: "UI"), STButton(title: "Test")]
    
    var viewModel = STCollectionViewModel()
    
    init() {
        let layout                                  = UICollectionViewFlowLayout()
        layout.scrollDirection                      = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        cells = viewModel.createButtonsWithTraineeDirections()
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
    
    
    private func getButtons(strings: [String]) -> [STButton] {
        let buttons = strings.map { STButton(title: $0) }
        return buttons
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
//        cell.isUserInteractionEnabled = true
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //MARK: - height and width cell in collecitonView
        return CGSize(width: 71, height: 44)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DIDSELECTITEMAT: \(cells[indexPath.row].titleLabel?.text!)")
        
        cells[indexPath.row].didPressed()
        
        let offsetX         = collectionView.contentOffset.x
        let contentWidth   = collectionView.contentSize.width
        
        print("offsetX = \(offsetX)")
        print("contentWidth = \(contentWidth)")
        
        animateButton(collectionView: collectionView)
    }
    
    func scrollViewDidEndDragging(_ collectionView: UIScrollView, willDecelerate decelerate: Bool) {
//        let offsetX         = collectionView.contentOffset.x
//        let contentWidth   = collectionView.contentSize.width
//
//        print("offsetX = \(offsetX)")
//        print("contentWidth = \(contentWidth)")
//        let heightOfDisplay = collecionView.frame.size.t
    }
    
    func animateButton(collectionView: UICollectionView) {
//        UIView.animate(withDuration: 0.25) {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0)

            collectionView.setCollectionViewLayout(layout, animated: true)
//        }
    }

}
