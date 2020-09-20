//
//  MoneyFormatter.swift
//  appautofin
//
//  Created by Alexander Lopez on 21/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class StringFormatter {
	static var moneyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.allowsFloats = true
		formatter.usesGroupingSeparator = true
		formatter.numberStyle = .currency
		formatter.locale = Locale.current
		formatter.maximumFractionDigits = 2
		formatter.minimumFractionDigits = 2
		return formatter
	}()
}
