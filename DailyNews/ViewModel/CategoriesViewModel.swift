//
//  CategoriesViewModel.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 31/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation

protocol NewsCategories {
    var newsArticles: NewsContent? {get}
    func getNewsbyCategory(categoryName: String)
    func getRowCount() -> Int
}


// MARK: Categories View Model
class CategoriesViewModel: NewsCategories {
    
    var newsArticles: NewsContent?
    let apiParser: NewsApiHandler
    weak var outputDelegate: OutputDelegate?
    
    init(apiService: NewsApiHandler = NewsApiHandler(), output: OutputDelegate) {
        self.apiParser = apiService
        self.outputDelegate = output
    }
    
    
    func getNewsbyCategory(categoryName: String) {
//        let query = "https://newsapi.org/v2/top-headlines?country=in&category=\(categoryName)&apiKey=09665f152e7248eda8a8ac60b19b45cc"
        
        guard let requestURL = URL(string: EndPoints.getURLof(category: categoryName) ) else {
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
    
    
    func getRowCount() -> Int {
        return newsArticles?.articles.count ?? 0
    }
    
    
}
