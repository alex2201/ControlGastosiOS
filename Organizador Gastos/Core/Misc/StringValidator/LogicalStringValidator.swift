//
//  LogicalStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez on 09/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class LogicalStringValidator: StringValidator {
	
	let firstValidator: StringValidator
	let secondValidator: StringValidator
	let operation: StringValidationLogicalOperation
	
	init(firstValidator: StringValidator, secondValidator: StringValidator, operation: LogicalStringValidator.StringValidationLogicalOperation) {
		self.firstValidator = firstValidator
		self.secondValidator = secondValidator
		self.operation = operation
	}
	
	enum StringValidationLogicalOperation {
		case or
		case and
	}
	
	func validate(string: String) -> Bool {
		switch operation {
		case .or:
			return firstValidator.validate(string: string) || secondValidator.validate(string: string)
		case .and:
			return firstValidator.validate(string: string) && secondValidator.validate(string: string)
		}
	}
}
