//
//  ImageViewExtension.swift
//  DailyNews
//
//  Created by Vishnu Balakrishnan Nair on 30/08/21.
//  Copyright © 2021 Vishnu Balakrishnan Nair. All rights reserved.
//

import Foundation
import UIKit


var imageCache  = NSCache<NSString, UIImage>()

extension UIImageView {
    /// Function to load image from URL and display it on ImageView.
    ///
    /// - Parameter urlstring: URL of the image to be displayed.
    
    public func load(urlstring: String) {
        
        /// If Image Present in Cache Memory Avoid APi Call and Load From Cache.
        if let cachedImage = imageCache.object(forKey: urlstring as NSString) {
                debugPrint("Image Loaded From Cache")
                self.image = cachedImage
            
        } else {
            guard let url = URL(string: urlstring) else {
                return self.image = UIImage(named: EndPoints.defaultImage)
            }
            
            DispatchQueue.main.async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        debugPrint("Image Loaded From API Call")
                        DispatchQueue.main.async {
                            imageCache.setObject(image, forKey: urlstring as NSString)
                            self.image = image
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.image = UIImage(named: EndPoints.defaultImage)
                    }
                    
                }
            }
        }
        
    }
}
