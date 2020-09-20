//
//  DecimalStringValidator.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 02/06/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

class DecimalStringValidator: StringValidator {
	private let regexValidator = RegexStringValidator(regexString: "^0{2,}", options: .caseInsensitive)
	
	func validate(string: String) -> Bool {
		//        return string.isEmpty || Double(string) != nil
		guard !string.isEmpty else {
			return true
		}
		
		let hasTwoOrMoreZeros = regexValidator.validate(string: string)
		if !hasTwoOrMoreZeros {
			return isDecimal(string)
		} else {
			return false
		}
	}
    
    private func isDecimal(_ string: String)->Bool{
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.maximumFractionDigits = 2
        formatter.allowsFloats = true
        formatter.locale = Locale.current
        return formatter.number(from: string) != nil
    }
}


