//
//  STInfinityCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 09.02.23.
//

import UIKit


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
        cell.configure(button: cells[indexPath.row % cells.count])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size    = cells[indexPath.row % cells.count].frame.size
        let width   = size.width + STFrameConstants.widthPadding
        
        return CGSize(width: width, height: STFrameConstants.heightOfCollectionViewCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let actualRow = indexPath.row % cells.count
        
        didPressAllRepeatedButtons(to: actualRow)
        moveElemToLeftBorder(indexPath: IndexPath(item: indexPath.row, section: 0), animated: true)
    }
    
    
    //MARK: - Configure
    private func configureCollectionView() {
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
    
    
    //MARK: - Set
    
    /// create array of buttons to view on cells
    /// - Parameter traineeDirections: array of string with trainee directions
    func set(traineeDirections: [String]) {
        cells = traineeDirections.isEmpty ? [STButton()] : createButtons(with: traineeDirections)
    }
    
    
    //MARK: - Helpers
    private func moveElemToLeftBorder(indexPath: IndexPath, animated: Bool) {
        scrollToItem(at: indexPath, at: .left, animated: animated)
    }
    
    
    /// When we scroll to left or right edge - go to middle elem
    /// - Parameter indexPath: check if last or first elem
    private func returnElemFromEdgeIfNeeded(indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == numberOfCells - 1 {
            moveElemToLeftBorder(indexPath: IndexPath(row: middlePosition,  section: 0), animated: false)
        }
    }
    
    
    /// If buttons in array with equal title - press its all
    /// - Parameter row: position of button compare with
    private func didPressAllRepeatedButtons(to row: Int) {
        for cell in cells {
            if cell.titleLabel?.text == cells[row].titleLabel?.text {
                cell.didPress()
            }
            cells[row].didPress()
        }
    }
    
    
    /// Create buttons for cells in InfinityCollectionView, If count of Strings less than needed - add Strings to array and create array of buttons
    /// - Parameter traineeDirections:input array of Stirngs
    /// - Returns: created array of buttons
    private func createButtons(with traineeDirections: [String]) -> [STButton] {
        var traineeDirections = traineeDirections
        if traineeDirections.count < minCountOfCollectionViewCells {
            traineeDirections = modifyArrayOfStringToPossibleCount(traineeDirections)
        }
        let buttons = traineeDirections.map { STButton(title: $0) }
        return buttons
    }
    
    
    /// check if count of strings >= minimum count of cells. (That needed for reusable cells in my implimintation of infinity scroll view)
    /// - Parameter arrayOfString: array for check
    /// - Returns: modified array
    private func modifyArrayOfStringToPossibleCount(_ arrayOfString: [String]) -> [String] {
        var modifiedArray = arrayOfString
        for _ in 0...minCountOfCollectionViewCells {
            if modifiedArray.count >= minCountOfCollectionViewCells { break }
            modifiedArray += modifiedArray
        }
        return modifiedArray
    }
}
