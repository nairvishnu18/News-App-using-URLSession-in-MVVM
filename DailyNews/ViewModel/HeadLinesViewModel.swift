//
//  HeadLinesViewModel.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation


protocol NewsHeadLines {
    var newsArticles: NewsContent? {get}
    func getNewsData()
    func getRowCount() -> Int
    
}

protocol OutputDelegate: class {
    func didSuccess()
    func didFail()
}

// MARK: HeadLinesViewModel
class HeadLinesViewModel: NewsHeadLines {
    
    var newsArticles: NewsContent?
    let apiParser: NewsApiHandler
    weak var outputDelegate: OutputDelegate?
    
    init(apiService: NewsApiHandler = NewsApiHandler(), output: OutputDelegate) {
        self.apiParser = apiService
        self.outputDelegate = output
    }
    
    func getNewsData() {
        guard let requestURL = URL(string: EndPoints.baseURL) else {
            debugPrint(CustomErrors.invalidURL.rawValue)
            return
        }

        apiParser.parse(from: requestURL, requestType: NewsContent.self) { [weak self] (articles, error) in
            if error == nil {
                self?.newsArticles = articles
                self?.outputDelegate?.didSuccess()
                
            } else {
                debugPrint(CustomErrors.parsingFailed.rawValue)
                self?.outputDelegate?.didFail()
                
            }
        }
    }
    
    /// To get the numbers of rows required in tableview
    ///
    /// - Returns: **Int** Count of Articles 
    func getRowCount() -> Int {
        return newsArticles?.articles.count ?? 0
    }
    
    
}
