//
//  CollectionViewExtensions.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 31/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation
import UIKit


extension CategoryCollectionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewItems.newsCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
        let newsCategoryData = CollectionViewItems.newsCategory[indexPath.row]
        
        collectionCell.loadDatainCollectionViewCell(categoryItem: newsCategoryData)
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        let newsCategoryItem = CollectionViewItems.newsCategory[indexPath.row]
        categoryVC.newsCategory = newsCategoryItem
        self.navigationController?.pushViewController(categoryVC, animated: true)
        
    }
    
}
