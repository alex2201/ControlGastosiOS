//
//  StringExtension.swift
//  appNissanImperioSwift
//
//  Created by Alexander Lopez Cedillo on 16/10/20.
//

import UIKit

extension String {
    var urlSafe: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
    func isDecimal()->Bool{
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.maximumFractionDigits = 2
        formatter.allowsFloats = true
        formatter.locale = Locale.current
        return formatter.number(from: self) != nil
    }
    
    var underlined: NSAttributedString {
        NSAttributedString(string: self, attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
    }
    
    func formated(for format: StringFormatStyle) -> String {
        switch format {
        case .money:
            return StringFormatter.moneyFormatter.string(from: NSNumber(value: Double(self)!))!
        }
    }
    
    enum StringFormatStyle {
        case money
    }
}
