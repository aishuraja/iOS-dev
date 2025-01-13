//
//  ImageCache.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/12/25.
//

import UIKit

// step 2: This class is used for saving and managing the pictures

class ImageCache {
    // creating a directory to store the path of the folders where images are saved
    private let cacheDirectory: URL
    
    init(){
        // providing access to the file system on the device and ensures all caches images are stored in central directory that the system manages
        cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        
    }
    // retrives the cached image from the disk if it exists
    func getImage(for url : URL) -> UIImage? {
        let filepath = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        //checks if the file exists
        guard let data = try? Data(contentsOf: filepath) else { return nil }
        // if exists return the UIImage ( convert data to image )
        return UIImage(data: data)
    }
    
    // save images to cache directory for future use 
    func saveImage(_ image: UIImage, for url: URL){
        let filepath = cacheDirectory.appendingPathComponent(url.lastPathComponent)
        guard let data = image.pngData() else { return }
        try? data.write(to: filepath)
    }
    
    
}
