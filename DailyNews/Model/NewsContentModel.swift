//
//  NewsContentModel.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation


// MARK: - Newscontent
struct NewsContent: Decodable {
    let articles: [Article]
//    let status: String
//    let message: String?
//    let code: String?
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let title: String
    let url: String
    let urlToImage: String?
    
    var imageURL: String {
        return urlToImage ?? EndPoints.defaultImage
    }
    
    
    enum CodingKeys: String, CodingKey {
        case source,title,url
        case urlToImage
    }
}

// MARK: - Source
struct Source: Decodable {
    let name: String?
}
