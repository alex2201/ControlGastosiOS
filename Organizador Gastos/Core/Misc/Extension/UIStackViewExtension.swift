//
//  UIStackViewExtension.swift
//  appSeat
//
//  Created by Alexander Lopez Cedillo on 07/12/20.
//

import UIKit

extension UIStackView {
    func clear() {
        arrangedSubviews.forEach({ $0.removeFromSuperview() })
    }
    
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
