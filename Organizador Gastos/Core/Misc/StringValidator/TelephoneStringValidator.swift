//
//  TelephoneStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez on 09/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class TelephoneStringValidator: StringValidator {
	private let validator = LogicalStringValidator(
		firstValidator: NumericStringValidator(
			numberPlaces: 12,
			mode: .equal
		),
		secondValidator: NumericStringValidator(numberPlaces: 13, mode: .equal),
		operation: .or
	)
	
	func validate(string: String) -> Bool {
		return validator.validate(string: string)
	}
	
}
