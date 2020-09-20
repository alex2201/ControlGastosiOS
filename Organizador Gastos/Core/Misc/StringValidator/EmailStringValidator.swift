//
//  EmailStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 06/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class EmailStringValidator: StringValidator {
	private let regexValidator = RegexStringValidator(regexString: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
	
	func validate(string: String) -> Bool {
		return regexValidator.validate(string: string)
	}
}
