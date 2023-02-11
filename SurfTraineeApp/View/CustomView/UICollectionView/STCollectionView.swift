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
        layout.minimumInteritemSpacing              = 12
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

    let numberOfCells = 100000
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cells.count
//        return 100000
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: STCollectionViewCell.id, for: indexPath) as! STCollectionViewCell
        
        cell.button = cells[indexPath.row % cells.count]
        cell.configureButton()
        returnElemFromEdgeToMiddle(indexPath: indexPath)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //MARK: - height and width cell in collecitonView
        
//        let size = cells[indexPath.row].frame.size
        let size = cells[indexPath.row % cells.count].frame.size
        let width = size.width + 44
        return CGSize(width: width, height: 44)
    }
    
    var middleElem : Int = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("DIDSELECTITEMAT: \(cells[indexPath.row].titleLabel?.text!)")
        
//        moveElemToLeftBorder(indexPath: indexPath)
//        cells[indexPath.row].didPressed()
        
        let actualRow = indexPath.row % cells.count
//        print(actualRow)
        cells[actualRow].didPressed()
        moveElemToLeftBorder(indexPath: IndexPath(item: indexPath.row, section: 0), animated: true)
    }
    
    private func moveElemToLeftBorder(indexPath: IndexPath, animated: Bool) {
        scrollToItem(at: indexPath, at: .left, animated: animated)
    }
    
    private func returnElemFromEdgeToMiddle(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == numberOfCells - 1 {
            moveElemToLeftBorder(indexPath: IndexPath(row: numberOfCells / 2,  section: 0), animated: false)
        }
    }
}
