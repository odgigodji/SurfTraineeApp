//
//  STTwoRowCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit

class LeftAlignCellCollectionFlowLayout: UICollectionViewFlowLayout {

    private var cellHeight: CGFloat = 44
    init(cellHeight: CGFloat) {
        super.init()
        self.cellHeight = cellHeight
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        guard let collectionView = self.collectionView else { return nil }

        self.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        var newAttributes = attributes
        var leftMargin = self.sectionInset.left
        var maxY: CGFloat = -1.0

        let availableWidth: CGFloat = collectionView.frame.width
        let layout = collectionView.collectionViewLayout

        for attribute in attributes {
            if let cellAttribute = layout.layoutAttributesForItem(at: attribute.indexPath) {
                if cellAttribute.frame.width > availableWidth {
                    cellAttribute.frame.origin.x = 0
                    cellAttribute.frame.size = CGSize(width: availableWidth, height: cellHeight)
                }
                else {
                    if cellAttribute.frame.origin.y >= maxY {
                        leftMargin = self.sectionInset.left
                    }

                    var frame = cellAttribute.frame
                    frame.origin.x = leftMargin
                    frame.size.height = cellHeight
                    cellAttribute.frame = frame

                    leftMargin += cellAttribute.frame.width + self.minimumInteritemSpacing
                    maxY = max(cellAttribute.frame.maxY , maxY)
                }

                newAttributes.append(cellAttribute)
            }
        }

        return newAttributes
    }
}


class STTwoRowCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - test buttons
    var cells = [STButton]()
    
    var viewModel = STCollectionViewModel()
    
    init() {
//        let flowLayout = LeftAlignCellCollectionFlowLayout(cellHeight: 40)
//        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        flowLayout.minimumInteritemSpacing = 12
//        flowLayout.minimumLineSpacing = 12
//        flowLayout.scrollDirection = .vertical

        
        
        
        
        
        let layout                                  = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
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


extension UICollectionViewLayout {
    static func fixedSpacedFlowLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(50),
            heightDimension: .estimated(50)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(6),
            top: .fixed(12),
            trailing: .fixed(0),
            bottom: .fixed(6)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
