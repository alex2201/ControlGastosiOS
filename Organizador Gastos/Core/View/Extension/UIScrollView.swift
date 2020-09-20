//
//  UIScrollView.swift
//  appautofin
//
//  Created by Alexander Lopez on 24/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}

