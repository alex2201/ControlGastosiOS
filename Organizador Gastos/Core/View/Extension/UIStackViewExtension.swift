//
//  UIStackViewExtension.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 01/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
