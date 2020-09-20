//
//  DesignableTextField.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 06/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
	
	@IBInspectable var leftImage: UIImage? {
		didSet {
			if let leftImage = leftImage {
				let imageView = getViewFor(image: leftImage)
				leftViewMode = .always
				leftView = imageView
			} else {
				leftViewMode = .never
				leftView = nil
			}
		}
	}
	
	@IBInspectable var rightImage: UIImage? {
		didSet {
			if let leftImage = leftImage {
				let imageView = getViewFor(image: leftImage)
				rightViewMode = .always
				rightView = imageView
			} else {
				rightViewMode = .never
				rightView = nil
			}
		}
	}
	
	@IBInspectable var lineColor: UIColor? = .black {
		didSet {
			updateView()
		}
	}
	
	@IBInspectable var leftPadding: CGFloat = 0
	
	@IBInspectable var bottomLine: Bool = false {
		didSet {
			if bottomLine {
				underlined()
			}
		}
	}
	
	@IBInspectable var radius: CGFloat = 0.0 {
		didSet {
			layer.cornerRadius = radius
		}
	}
    
    override var bounds: CGRect {
        didSet {
            updateView()
        }
    }
    
    private let underlineLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.insertSublayer(underlineLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.insertSublayer(underlineLayer, at: 0)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateView()
        
    }
    
    private func getViewFor(image: UIImage) -> UIView {
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
		imageView.contentMode = .scaleAspectFit
		imageView.image = leftImage
		return imageView
	}
	
	func updateView() {
		if let leftImage = leftImage {
			leftViewMode = .always
			//			let view = UIView(frame: CGRect(x: 0, y: 0, width: leftImageSize, height: leftImageSize))
			let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
			imageView.contentMode = .scaleAspectFit
			imageView.image = leftImage
			// Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
			leftView = imageView
		} else if let rightImage = rightImage {
			rightViewMode = .always
			let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
			imageView.contentMode = .scaleAspectFit
			imageView.image = rightImage
			// Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
			rightView = imageView
		} else {
			leftViewMode = .never
			leftView = nil
			rightViewMode = .never
			rightView = nil
		}
		
		if bottomLine {
			underlined()
		}
		
	}
	
	func underlined(){
        
        let path = UIBezierPath()
        let bounds = self.bounds
        let origin = bounds.origin
        path.move(to: CGPoint(x: origin.x - 1, y: bounds.maxY + 1))
        path.addLine(to: CGPoint(x: bounds.maxX + 1, y: bounds.maxY + 1))
        
        underlineLayer.path = path.cgPath
        
        underlineLayer.lineWidth = 1.0
        underlineLayer.strokeColor = (lineColor ?? UIColor.black).cgColor
        
	}

	// Provides left padding for images
	override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		let textRect = super.leftViewRect(forBounds: bounds)
		return CGRect(x: textRect.origin.x, y: textRect.origin.y, width: textRect.width + leftPadding, height: textRect.height)
	}
	
}
