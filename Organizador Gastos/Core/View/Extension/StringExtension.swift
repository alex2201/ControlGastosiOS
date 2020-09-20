//
//  String.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 08/06/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

extension String{
    func isDecimal()->Bool{
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.maximumFractionDigits = 2
        formatter.allowsFloats = true
        formatter.locale = Locale.current
        return formatter.number(from: self) != nil
    }
}
