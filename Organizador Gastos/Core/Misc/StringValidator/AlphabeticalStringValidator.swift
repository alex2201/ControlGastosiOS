//
//  AlphabeticalStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez on 09/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class AlphabeticalStringValidator: StringValidator {
	private let regexValidator = RegexStringValidator(
		regexString: "^[A-Za-z ]*$",
		options: .anchorsMatchLines)
	
	func validate(string: String) -> Bool {
		return regexValidator.validate(string: string)
	}
}
