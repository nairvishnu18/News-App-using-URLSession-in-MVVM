//
//  Constants.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation

enum CustomErrors: String {
    
    case invalidURL = "Error: Invalid URL!"
    case parsingFailed = "Error: Error in assigning data to Model"
    case noDataFound = "Error: No Data Fetched from API"
    case didFail = "Failed to fetch Data"
    
}


struct EndPoints {
    static let baseURL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=09665f152e7248eda8a8ac60b19b45cc"
    
    static func getURLof(category newsCategory: String ) -> String {
        let categoryURL = "https://newsapi.org/v2/top-headlines?country=in&category=\(newsCategory)&apiKey=09665f152e7248eda8a8ac60b19b45cc"
        return categoryURL
    }

    static let defaultImage = "launchScreen"
}



struct CollectionViewItems {

    static let newsCategory = [
        "Business",
        "Entertainment",
        "Sports",
        "Science",
        "Health",
        "Technology"
    ]
}

