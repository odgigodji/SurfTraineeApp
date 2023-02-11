//
//  STTwoRowCollectionView.swift
//  SurfTraineeApp
//
//  Created by Nikita Evdokimov on 10.02.23.
//

import UIKit


class STTwoRowVerticalCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - test buttons
    var cells = [STButton]()
    
    var viewModel: STCollectionViewModelProtocol = STCollectionViewModel()
    
    init() {
        let layout = STLeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12

        super.init(frame: .zero, collectionViewLayout: layout)
        configureCollectionView()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return calculateSizeOfCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        cells[indexPath.row].didPressed()
    }
    
    
    //MARK: - Private
    private func calculateSizeOfCell(indexPath: IndexPath) -> CGSize {
        let size = cells[indexPath.row].frame.size
        let width = size.width + STFrameConstants.widthPadding
        return CGSize(width: width, height: STFrameConstants.heightOfCollectionViewCell)
    }
    
    private func configureCollectionView() {
        cells = viewModel.createButtonsWithTraineeDirections()
        
        translatesAutoresizingMaskIntoConstraints   = false
        showsHorizontalScrollIndicator              = false
        backgroundColor                             = .white
        
        delegate                                    = self
        dataSource                                  = self
        register(STCollectionViewCell.self, forCellWithReuseIdentifier: STCollectionViewCell.id)
    }
}

