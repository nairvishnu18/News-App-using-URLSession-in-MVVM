//
//  NewsApiHandler.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation


struct NewsApiHandler {
    
    /// A generic API Hanlder to parse the request API URL and Decode it to given type.
    ///
    /// - Parameters:
    ///   - requestUrl: URL which need to be parsed and decoded.
    ///   - resultType: Type of the Model which holds the response data.
    ///   - completionHandler: @escaping to hold and return the data after execution of the function block.
    func parse<T: Decodable>(from requestURL: URL, requestType: T.Type, completionHandler: @escaping(_ result: T?, Error?) -> Void) {
        
        URLSession.shared.dataTask(with: requestURL) { (data, urlResponse, error) in
            guard let responseData = data else {
                debugPrint(CustomErrors.noDataFound.rawValue)
                if let error = error {
                    completionHandler(nil,error)
                    //debugPrint(String(describing: error))
                    debugPrint(error.localizedDescription)
                }
                return
            }
            
            //Parse Response
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: responseData)
                //debugPrint(result)
                completionHandler(result, nil)
                
            } catch let error {
                //debugPrint(String(describing: error))
                debugPrint(error.localizedDescription)
            }
            
            }.resume()
    }
}



