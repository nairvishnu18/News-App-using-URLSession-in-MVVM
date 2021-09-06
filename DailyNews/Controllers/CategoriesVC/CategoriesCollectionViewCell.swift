//
//  CategoriesCollectionViewCell.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 31/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func loadDatainCollectionViewCell(categoryItem: String) {
        self.categoryLabel.text = categoryItem
        self.categoryImageView.image = UIImage(named: categoryItem)
    }
}
