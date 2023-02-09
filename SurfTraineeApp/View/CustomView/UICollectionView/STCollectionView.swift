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
        
        animateButton(button: cells[indexPath.row], position: indexPath.row)
    }
    
    func scrollViewDidEndDragging(_ collectionView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetX         = collectionView.contentOffset.x
        let contentWidth   = collectionView.contentSize.width
        let widthOfDisplay  = self.frame.size.width

        print("offsetX = \(offsetX)")
        print("contentWidth = \(contentWidth)")
        print("widthOfDispay = \(widthOfDisplay)")
//        let heightOfDisplay = collecionView.frame.size.t
        
        
//        if offsetX >= contentWidth - widthOfDisplay {
//            print("HHER")
//            cells += cells
//            reloadData()
//        }
    }
    
    func animateButton(button: STButton, position: Int) {
        //        let layout = UICollectionViewFlowLayout()
        //        layout.scrollDirection = .horizontal
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        collectionView.setCollectionViewLayout(layout, animated: true)
        
        let offsetX         = self.contentOffset.x
        let contentWidth    = self.contentSize.width
        let widthOfDisplay  = self.frame.size.width
        
//        print("offsetX = \(offsetX)")
//        print("contentWidth = \(contentWidth)")
//        print("widthOfDispay = \(widthOfDisplay)")
        

        
//        let singleDistance = button.frame.width
//        if position == 0 {
//            return
//        }
//
//        if position == 1 {
//        UIView.animate(withDuration: 0.5) {
//            self.contentOffset.x += (singleDistance * CGFloat(position))
//        }
//        }
//        let firstElem = button[position]
//        let contentHeight   = collectionView.contentSize.height
        

        
//        if firstPosition
        
        UIView.animate(withDuration: 0.4) {
//            DispatchQueue.main.async {
                self.contentOffset.x += button.frame.width
            self.layoutIfNeeded()
//            }
        }
    }
}
