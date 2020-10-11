//
//  SentenceSequenceStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 10/09/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class SentenceSequenceStringValidator: StringValidator {
	private let regexValidator = RegexStringValidator(
		regexString: "^[A-Za-z]+( [A-Za-z0-9]+)*$",
		options: .anchorsMatchLines
	)
	
	func validate(string: String) -> Bool {
		return regexValidator.validate(string: string)
	}
}
