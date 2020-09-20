//
//  CarrouselImageFetcher.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 24/08/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

protocol CarrouselImageFetcherDelegate: class {
	func carrouselImageFetcher(_ carrouselImageFetcher: CarrouselImageFetcher, didFetch imageData: Data?, from url: NSURL, for indexPath: IndexPath)
}

class CarrouselImageFetcher: NSObject {
	private let imageFetcher = ImageFetcher()
	weak var delegate: CarrouselImageFetcherDelegate?
	
	func fetchImage(from url: NSURL, for indexPath: IndexPath) {
		imageFetcher.fetchImage(fromUrl: url) { (data, url) in
			let nsurl = NSURL(string: url.absoluteString)!
			self.delegate?.carrouselImageFetcher(self, didFetch: data, from: nsurl, for: indexPath)
		}
	}
}
