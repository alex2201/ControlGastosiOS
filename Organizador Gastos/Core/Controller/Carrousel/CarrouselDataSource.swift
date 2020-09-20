//
//  CarrouselDataSource.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 24/08/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

protocol CarrouselDataSourceDelegate: class {
	func carrouselDataSource(_ carrouselDataSource: CarrouselDataSource, didFetchImageFor indexPath: IndexPath)
}

class CarrouselDataSource: NSObject, UICollectionViewDataSourcePrefetching, UICollectionViewDataSource, CarrouselImageFetcherDelegate {
	
	private let sources: [NSURL]
	private let imageFetcher = CarrouselImageFetcher()
	weak var delegate: CarrouselDataSourceDelegate?
	private var cache = Cache<NSURL, UIImage>()
	private var fetched = Set<NSURL>()
	
	init(sources: [NSURL]) {
		self.sources = sources
		super.init()
		imageFetcher.delegate = self
	}
	
	deinit {
		cache.clear()
	}
	
	func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
		DispatchQueue.global(qos: .userInitiated).async {
			for indexPath in indexPaths {
				let row = indexPath.row
				let url = self.sources[row]
				guard !self.fetched.contains(url), !self.cache.isFetched(forKey: url) else { continue }
				self.fetched.insert(url)
				self.imageFetcher.fetchImage(from: url, for: indexPath)
			}
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sources.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarrouselCell.identifier, for: indexPath) as! CarrouselCell
		
		let row = indexPath.row
		let url = sources[row]
		
		if let image = cache.getObject(forKey: url) {
			cell.hideActivityIndicator()
			cell.configure(with: image)
		} else {
			cell.hideImage()
			cell.showActivityIndicator()
			imageFetcher.fetchImage(from: url, for: indexPath)
		}
		
		return cell
	}
	
	func carrouselImageFetcher(_ carrouselImageFetcher: CarrouselImageFetcher, didFetch imageData: Data?, from url: NSURL, for indexPath: IndexPath) {
		if let imageData = imageData {
			let image = UIImage(data: imageData)!
			cache.insert(image, forKey: url)
		} else {
			cache.insertNil(forKey: url)
		}
		delegate?.carrouselDataSource(self, didFetchImageFor: indexPath)
	}
	
}
