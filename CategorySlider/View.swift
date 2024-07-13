//
//  view.swift
//  CategorySlider
//
//  Created by AbdallahMahameed on 13/07/2024.
//

import UIKit

class View: UIView {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var mockData = [CollectionViewCellModel(title: "item 0", isSelected: false),
                    CollectionViewCellModel(title: "item 1", isSelected: false),
                    CollectionViewCellModel(title: "item 2", isSelected: false),
                    CollectionViewCellModel(title: "item 3", isSelected: false),
                    CollectionViewCellModel(title: "item 4", isSelected: false),
                    CollectionViewCellModel(title: "item 5", isSelected: false),
                    CollectionViewCellModel(title: "item 6", isSelected: false)]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sliderCollectionView.register(UINib(nibName: CollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.cellID)
    }
}

extension View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellID, for: indexPath) as! CollectionViewCell
        let viewModel = mockData[indexPath.item]
        cell.configure(viewModel: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mockData.forEach { item in
            item.isSelected = false
        }
        mockData[indexPath.item].isSelected.toggle()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemWidth = 100
        let numberOfItems = mockData.count
        let totalWidth = 100*numberOfItems
        
        if totalWidth < Int(collectionView.frame.width) {
            itemWidth = Int(collectionView.frame.width)/numberOfItems
        }
        
        return CGSize(width: itemWidth, height: 60)
    }
}



