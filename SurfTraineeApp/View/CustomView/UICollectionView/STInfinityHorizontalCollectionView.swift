//
//  STInfinityCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


final class STInfinityHorizontalCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var cells = [STButton]()
    private let numberOfCells = 100000
    
    var middlePosition: Int {
        numberOfCells / 2
    }
    
    var viewModel = STInfinityCollectionViewModel()
    
    init() {
        let layout                                  = UICollectionViewFlowLayout()
        layout.scrollDirection                      = .horizontal
        layout.minimumLineSpacing                   = 12
        layout.minimumInteritemSpacing              = 12
        
        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell    = dequeueReusableCell(withReuseIdentifier: STCollectionViewCell.id, for: indexPath) as! STCollectionViewCell
        
        cell.button = cells[indexPath.row % cells.count]
        cell.configureButton()
        returnElemFromEdgeToMiddle(indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size    = cells[indexPath.row % cells.count].frame.size
        let width   = size.width + STFrameConstants.widthPadding
        return CGSize(width: width, height: STFrameConstants.heightOfCollectionViewCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let actualRow = indexPath.row % cells.count
        
        didPressedAllEqualButtons(to: actualRow)
        
//        cells[actualRow].didPressed()
        moveElemToLeftBorder(indexPath: IndexPath(item: indexPath.row, section: 0), animated: true)
    }
    
    
    //MARK: - Private
    private func moveElemToLeftBorder(indexPath: IndexPath, animated: Bool) {
        scrollToItem(at: indexPath, at: .left, animated: animated)
    }
    
    private func returnElemFromEdgeToMiddle(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == numberOfCells - 1 {
            moveElemToLeftBorder(indexPath: IndexPath(row: middlePosition,  section: 0), animated: false)
        }
    }
    
    private func configureCollectionView() {
        
        cells                                       = viewModel.createButtonsWithTraineeDirections()
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
    
    private func didPressedAllEqualButtons(to row: Int) {
        for cell in cells {
            if cell.titleLabel?.text == cells[row].titleLabel?.text {
                cell.didPressed()
            }
            cells[row].didPressed()
        }
    }
}
