//
//  CurrencyTextField.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 11/02/21.
//

import UIKit
import Combine

class CurrencyTextField: UIToolbarTextField {
    private var editingChangeSub: AnyCancellable!
    private let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        editingChangeSub = publisher(for: .editingChanged)
            .sink(receiveValue: { (field) in
                var number: NSNumber!
                var amountWithPrefix = field.text ?? "No hay texto"
                let formatter = NumberFormatter()
                formatter.numberStyle = .currencyAccounting
                formatter.currencySymbol = "$"
                formatter.maximumFractionDigits = 2
                formatter.minimumFractionDigits = 2

                amountWithPrefix = self.regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, amountWithPrefix.count), withTemplate: "")

                let double = (amountWithPrefix as NSString).doubleValue
                number = NSNumber(value: (double / 100))

                field.text = formatter.string(from: number)!
            })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
