//
//  HeadLinesTableViewCell.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsHeadLine: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadDataToTableViewCell(articles: Article) {
        self.newsSource.text = articles.source.name
        self.newsHeadLine.text = articles.title
        self.newsImage.load(urlstring: articles.imageURL)
    }
    
    
}
