//
//  ImageFetcher.swift
//  appCupra
//
//  Created by Mauricio Guerrero Vega on 10/08/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import Foundation

//protocol ImageFetcherDelegate {
//    func imageFetcher(_ imageFetcher: ImageFetcher, didFetchImageData imageData: Data?, fromUrl url: URL)
//}

class ImageFetcher {
    
    func fetchImage(fromUrl url: NSURL, completion: @escaping (Data?, URL) -> Void) {
        fetchImage(fromUrl: url.absoluteURL!, completion: completion)
    }
    
	func fetchImage(fromUrl url: URL, completion: @escaping (Data?, URL) -> Void) {
        let httpFetcher = AsyncHttpFetcher()
        httpFetcher.executeRequest(withUrl: url) { (result) in
            switch result {
            case .success(let data):
				completion(data, url)
            case .failure(let error):
                print("ImageFetcher Error: \(error.localizedDescription)")
				completion(nil, url)
            }
        }
    }
}
