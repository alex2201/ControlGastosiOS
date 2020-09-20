//
//  NotEmptyStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez on 09/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class NotEmptyStringValidator: StringValidator {
	
	func validate(string: String) -> Bool {
		return string.count > 0
	}
}
