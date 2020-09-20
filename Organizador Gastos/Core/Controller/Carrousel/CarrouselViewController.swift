//
//  CarrouselViewController.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 24/08/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class CarrouselViewController: UIViewController, CarrouselDataSourceDelegate, UICollectionViewDelegate {
	
	@IBInspectable var pageIndicatorTintColor: UIColor?
	@IBInspectable var currentPageIndicatorTintColor: UIColor?
	
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var collectionView: UICollectionView!
	
	private var carrouselDataSource: CarrouselDataSource!
	private var itemSize: CGSize!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(true)
	}
	
	private func setup() {
		collectionView.register(UINib(nibName: CarrouselCell.identifier, bundle: nil), forCellWithReuseIdentifier: CarrouselCell.identifier)
		
		pageControl.pageIndicatorTintColor = pageIndicatorTintColor
		pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
	}
	
	func configure(with sources: [NSURL], for size: CGSize) {
		pageControl.numberOfPages = sources.count
		carrouselDataSource = CarrouselDataSource(sources: sources)
		carrouselDataSource.delegate = self
		itemSize = size
		setupCollectionView()
		collectionView.reloadData()
	}
	
	private func setupCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = carrouselDataSource
		collectionView.prefetchDataSource = carrouselDataSource
		collectionView.collectionViewLayout = getFlowLayout()
		collectionView.showsHorizontalScrollIndicator = false
	}
	
	private func getFlowLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		
		layout.itemSize = itemSize
		layout.scrollDirection = .horizontal
		layout.sectionInset = .zero
		layout.minimumInteritemSpacing = 0.0
		layout.minimumLineSpacing = 0.0
		
		return layout
	}
	
	func carrouselDataSource(_ carrouselDataSource: CarrouselDataSource, didFetchImageFor indexPath: IndexPath) {
		DispatchQueue.main.async {
			self.collectionView.reloadItems(at: [indexPath])
		}
	}
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let x = targetContentOffset.pointee.x
		pageControl.currentPage = Int(x / view.frame.width)
	}
	
}
