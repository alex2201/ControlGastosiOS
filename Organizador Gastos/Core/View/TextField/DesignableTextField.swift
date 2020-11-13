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
                leftViewMode = .unlessEditing
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
    
    @IBInspectable var lineColor: UIColor? = .black
    
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
    
    private let underLineLayer = CAShapeLayer()
    
    private func getViewFor(image: UIImage) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = leftImage
        return imageView
    }
    
    func updateView() {
        if let leftImage = leftImage {
            leftViewMode = .always
            //            let view = UIView(frame: CGRect(x: 0, y: 0, width: leftImageSize, height: leftImageSize))
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
        let offset: CGFloat = 1.0
        path.move(to: CGPoint(x: self.bounds.minX - offset, y: self.bounds.maxY + offset * 2))
        path.addLine(to: CGPoint(x: self.bounds.maxX + offset, y: self.bounds.maxY + offset * 2))
        underLineLayer.path = path.cgPath
        underLineLayer.strokeColor = lineColor?.cgColor
        underLineLayer.lineWidth = 1.0
        underLineLayer.fillColor = UIColor.clear.cgColor
        underLineLayer.masksToBounds = false
        layer.addSublayer(underLineLayer)
    }

    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let textRect = super.leftViewRect(forBounds: bounds)
        return CGRect(x: textRect.origin.x, y: textRect.origin.y, width: textRect.width + leftPadding, height: textRect.height)
    }
    
}
