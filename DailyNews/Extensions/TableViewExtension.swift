//
//  TableViewExtension.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation
import UIKit

extension HeadLinesViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headLinesCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        let newsContentData = viewModel.newsArticles?.articles[indexPath.row]
        headLinesCell.loadDataToTableViewCell(articles: newsContentData!)
        
        return headLinesCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webViewVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let newsContentData = viewModel.newsArticles?.articles[indexPath.row].url
        webViewVC.newsURL = newsContentData!
        
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
  
}


extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.getRowCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = categoryTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        let newsContentData = categoryViewModel.newsArticles?.articles[indexPath.row]
        categoryCell.loadDataToTableViewCell(articles: newsContentData!)
        
        return categoryCell
    }
    
    
}
