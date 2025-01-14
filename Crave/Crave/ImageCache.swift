//
//  ImageCache.swift
//  Crave
//
//  Created by Aishwarya Raja on 1/12/25.
//

//import UIKit
//
//// step 2: This class is used for saving and managing the pictures


import UIKit
import CryptoKit // For hashing URLs

class ImageCache {
    private let cacheDirectory: URL

    init() {
        cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    private func filePath(for url: URL) -> URL {
        // Use a hash of the full URL to create a unique file name
        let hashedFileName = SHA256.hash(data: Data(url.absoluteString.utf8))
            .compactMap { String(format: "%02x", $0) }
            .joined()
        return cacheDirectory.appendingPathComponent(hashedFileName)
    }

    func getImage(for url: URL) -> UIImage? {
        let filePath = self.filePath(for: url)
        guard let data = try? Data(contentsOf: filePath) else { return nil }
        return UIImage(data: data)
    }

    func saveImage(_ image: UIImage, for url: URL) {
        let filePath = self.filePath(for: url)
        guard let data = image.pngData() else { return }
        try? data.write(to: filePath)
    }
}
