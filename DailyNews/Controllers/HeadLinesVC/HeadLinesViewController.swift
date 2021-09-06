//
//  ViewController.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 27/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import UIKit

class HeadLinesViewController: UIViewController, OutputDelegate {
  

    @IBOutlet weak var tableView: UITableView!
    var viewModel: NewsHeadLines!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        viewModel = HeadLinesViewModel(output: self)
        viewModel.getNewsData()
    }
    
    func didSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFail() {
        debugPrint(CustomErrors.didFail.rawValue)
    }
    


}

