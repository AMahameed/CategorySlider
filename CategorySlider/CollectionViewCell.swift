//
//  CollectionViewCell.swift
//  CategorySlider
//
//  Created by AbdallahMahameed on 13/07/2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var isSelectedCell: UIView!
    
    var viewModel: CollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: CollectionViewCellModel) {
        self.viewModel = viewModel
        
        title.text = viewModel.title
        isSelectedCell.isHidden = !viewModel.isSelected
        
    }
}

class CollectionViewCellModel {
    let title: String
    var isSelected: Bool
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}
