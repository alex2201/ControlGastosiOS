//
//  CarrouselCell.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 26/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class CarrouselCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage?) {
        bannerImage.image = image
        bannerImage.alpha = 1.0
    }
    
    func showActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func hideImage() {
        bannerImage.alpha = 0.0
    }
}
