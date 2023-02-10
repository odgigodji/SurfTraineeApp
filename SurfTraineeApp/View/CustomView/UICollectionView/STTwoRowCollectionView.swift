//
//  STTwoRowCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit


class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}


class STTwoRowCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - test buttons
    var cells = [STButton]()
    
    var viewModel = STCollectionViewModel()
    
    init() {
//        let layout = LeftAlignCellCollectionFlowLayout(cellHeight: 40)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        layout.minimumInteritemSpacing = 12
//        layout.minimumLineSpacing = 12

        
        let layout = LeftAlignedCollectionViewFlowLayout()
//        guard layoutAttribute.representedElementCategory == .cell else {
//            return
//        }
        
        
        
        
//        let layout                                  = UICollectionViewFlowLayout()
//
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
        
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        let width = UIScreen.main.bounds.width
//        let padding: CGFloat            = 12
        
//        let flowLayout                  = UICollectionViewFlowLayout()
//        layout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        
        
        
        
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        
        cells = viewModel.createButtonsWithTraineeDirections()
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
//        backgroundColor                             = .green
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
        

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UUICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
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
    
    //MARK: - height and width cell in collecitonView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return calculateSizeOfCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        cells[indexPath.row].didPressed()
    }
    
    private func calculateSizeOfCell(indexPath: IndexPath) -> CGSize {
        let size = cells[indexPath.row].frame.size
        let width = size.width + 40
        return CGSize(width: width, height: 44)
    }
    
    
}

