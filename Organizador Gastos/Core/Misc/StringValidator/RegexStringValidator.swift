//
//  RegexStringValidator.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 06/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class RegexStringValidator: StringValidator {
	private let regexString: String
	private let options: NSRegularExpression.Options
	
	init(regexString: String, options: NSRegularExpression.Options) {
		self.regexString = regexString
		self.options = options
	}
	
	func validate(string: String) -> Bool {
		do {
			let regex = try NSRegularExpression(pattern: regexString, options: options)
			return regex.numberOfMatches(in: string, options: .reportProgress, range: NSRange(location: 0, length: (string as NSString).length)) > 0
		} catch {
			fatalError(error.localizedDescription)
		}
	}
	
}
