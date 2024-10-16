//
//  ImageCacheManager.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation
import SwiftUI

class ImageCacheManager {
    
    static let instance = ImageCacheManager()
    
    private init() {  }
    
    
    var cachedImage: NSCache <NSString, UIImage> = {
        var cache = NSCache <NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024*1024*50
        return cache
    }()
    
    func add(key:String, image:UIImage) {
        self.cachedImage.setObject(image, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return cachedImage.object(forKey: key as NSString)
    }
    
    func clear() {
        cachedImage.removeAllObjects()
    }
    
}
