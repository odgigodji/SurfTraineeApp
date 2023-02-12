//
//  STInfinityCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit

//протокол перезентера под коллекшн вью
final class STInfinityHorizontalCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var cells = [STButton]()
    private let numberOfCells = 100000
    private let minCountOfCollectionViewCells = 16
    
    var middlePosition: Int {
        numberOfCells / 2
    }
    
    init() {
        let layout                      = UICollectionViewFlowLayout()
        layout.scrollDirection          = .horizontal
        layout.minimumInteritemSpacing  = 12
        super.init(frame: .zero, collectionViewLayout: layout)
        
        configureCollectionView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Delegate, DataSource, DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell    = dequeueReusableCell(withReuseIdentifier: STCollectionViewCell.id, for: indexPath) as! STCollectionViewCell
        
        returnElemFromEdgeIfNeeded(indexPath: indexPath)
        
        let button = cells[indexPath.row % cells.count]
        cell.configure(button: button)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size    = cells[indexPath.row % cells.count].frame.size
        let width   = size.width + STFrameConstants.widthPadding
        return CGSize(width: width, height: STFrameConstants.heightOfCollectionViewCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let actualRow = indexPath.row % cells.count
        
        didPressAllEqualButtons(to: actualRow)
        moveElemToLeftBorder(indexPath: IndexPath(item: indexPath.row, section: 0), animated: true)
    }
    
    //MARK: - Configuration
    private func configureCollectionView() {
//        cells                                       = viewModel.createButtonsWithTraineeDirections()
//        cells = output.createButtonsWithTraineeDirections()
//        updateInfinityCollectionView()
        
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
    
    //MARK: - Helpers
    private func moveElemToLeftBorder(indexPath: IndexPath, animated: Bool) {
        scrollToItem(at: indexPath, at: .left, animated: animated)
    }
    
    private func returnElemFromEdgeIfNeeded(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == numberOfCells - 1 {
            moveElemToLeftBorder(indexPath: IndexPath(row: middlePosition,  section: 0), animated: false)
        }
    }
    
    private func didPressAllEqualButtons(to row: Int) {
        for cell in cells {
            if cell.titleLabel?.text == cells[row].titleLabel?.text {
                cell.didPress()
            }
            cells[row].didPress()
        }
    }
    
    private func createButtons(with traineeDirections: [String]) -> [STButton] {
        var traineeDirections = traineeDirections
        if traineeDirections.count < minCountOfCollectionViewCells {
            traineeDirections = modifyArrayOfStringToPossibleCount(traineeDirections)
        }
        let buttons = traineeDirections.map { STButton(title: $0) }
        return buttons
    }
    
    private func modifyArrayOfStringToPossibleCount(_ arrayOfString: [String]) -> [String] {
        var modifiedArray = arrayOfString
        for _ in 0...minCountOfCollectionViewCells {
            if modifiedArray.count >= minCountOfCollectionViewCells { break }
            modifiedArray += modifiedArray
        }
        return modifiedArray
    }
    
    //MARK: - Set
    func set(traineeDirections: [String]) {
        cells = createButtons(with: traineeDirections)
    }
}


