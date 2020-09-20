//
//  RoundedView.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 06/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class AttributedView: UIView {

	@IBInspectable var cornerRadius: CGFloat = 0.0 {
		didSet {
			layer.cornerRadius = cornerRadius
		}
	}
	
	@IBInspectable var shadow: Bool = false {
		didSet {
			if shadow {
				layer.shadowOpacity = Float(shadowOpacity)
			} else {
				layer.shadowOpacity = 0.0
			}
		}
	}
	
	@IBInspectable var shadowOpacity: CGFloat = 1.0 {
		didSet {
			layer.shadowOpacity = Float(shadowOpacity)
		}
	}
	
	@IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: -3) {
		didSet {
			layer.shadowOffset = shadowOffset
		}
	}
	
	@IBInspectable var shadowColor: UIColor = UIColor.black {
		didSet {
			layer.shadowColor = UIColor.black.cgColor
		}
	}
	
	@IBInspectable var shadowRadius: CGFloat = 0.0 {
		didSet {
			layer.shadowRadius = shadowRadius
		}
	}
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
	
	override var bounds: CGRect {
		didSet {
			layer.cornerRadius = cornerRadius
			if shadow {
				layer.shadowOpacity = Float(shadowOpacity)
				layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: shadowRadius).cgPath
				layer.shouldRasterize = true
				layer.rasterizationScale = UIScreen.main.scale
			} else {
				layer.shadowOpacity = 0.0
			}
			layer.shadowRadius = shadowRadius
			
		}
	}
	
	private func roundCorners() {
		
	}

}
