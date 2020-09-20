//
//  StringValidator.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 02/06/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

protocol StringValidator {
    
    func validate(string: String) -> Bool
    
}

class DefaultStringValidator: StringValidator {
	func validate(string: String) -> Bool {
		return true
	}
}
