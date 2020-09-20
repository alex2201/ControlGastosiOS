//
//  RoundedCornersViewController.swift
//  appautofin
//
//  Created by Alexander Lopez on 10/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class AtributtedViewController: UIView {
	
	@IBInspectable var radius: CGFloat = 0.0 {
		didSet {
			layer.cornerRadius = radius
		}
	}

}
