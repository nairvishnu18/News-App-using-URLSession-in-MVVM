//
//  CategoryViewController.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 31/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, OutputDelegate {

    @IBOutlet weak var categorylabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    var newsCategory: String = ""
    var categoryViewModel: NewsCategories!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        self.categorylabel.text = newsCategory
        categoryViewModel = CategoriesViewModel(output: self)
        categoryViewModel.getNewsbyCategory(categoryName: newsCategory)
    }

    func didSuccess() {
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
    
    func didFail() {
        debugPrint(CustomErrors.didFail.rawValue)
    }
}
