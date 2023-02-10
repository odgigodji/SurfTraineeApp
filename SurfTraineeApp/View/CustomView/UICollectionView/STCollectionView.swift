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
    var cells = [STButton]()
    
    var viewModel = STCollectionViewModel()
    
    init() {
        let layout                                  = UICollectionViewFlowLayout()
        layout.scrollDirection                      = .horizontal
        layout.minimumLineSpacing                   = 12
        super.init(frame: .zero, collectionViewLayout: layout)
        
        
        
        cells = viewModel.createButtonsWithTraineeDirections()
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
//        backgroundColor = .green
        
        delegate                                    = self
        dataSource                                  = self
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
        
        let size = cells[indexPath.row].frame.size
        let width = size.width + 40
        return CGSize(width: width, height: 44)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("DIDSELECTITEMAT: \(cells[indexPath.row].titleLabel?.text!)")
        
        moveElemToLeftBorder(indexPath: indexPath)
        cells[indexPath.row].didPressed()
    }
    
    func scrollViewDidEndDragging(_ collectionView: UIScrollView, willDecelerate decelerate: Bool) {
//        let offsetX         = collectionView.contentOffset.x
//        let contentWidth   = collectionView.contentSize.width
//        let widthOfDisplay  = self.frame.size.width
//
//        print("offsetX = \(offsetX)")
//        print("contentWidth = \(contentWidth)")
//        print("widthOfDispay = \(widthOfDisplay)")
        
//        let heightOfDisplay = collecionView.frame.size.t
        
        
//        if offsetX >= contentWidth - widthOfDisplay {
//            print("HHER")
//            cells += cells
//            reloadData()
//        }
    }
    
    private func moveElemToLeftBorder(indexPath: IndexPath) {
        scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
