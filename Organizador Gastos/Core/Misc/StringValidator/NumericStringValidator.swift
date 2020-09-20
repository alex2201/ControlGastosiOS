//
//  NumericStringValidator.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 08/06/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

class NumericStringValidator: StringValidator {
	private var places = 0
	private var mode: NumericStringValidatorPlacesMode = .none
	
	enum NumericStringValidatorPlacesMode {
		case less
		case lessOrEqual
		case equal
		case greater
		case greaterOrEqual
		case none
	}
	
	convenience init(numberPlaces: Int, mode: NumericStringValidatorPlacesMode = .equal) {
		self.init()
		self.places = numberPlaces
		self.mode = mode
	}
	
    func validate(string: String) -> Bool {
		var valid =  string.isEmpty || Int(string) != nil
		
		switch mode {
		case .less:
			valid = valid && string.count < places
		case .lessOrEqual:
			valid = valid && string.count <= places
		case .equal:
			valid = valid && string.count == places
		case .greater:
			valid = valid && string.count > places
		case .greaterOrEqual:
			valid = valid && string.count >= places
		case .none:
			break
		}
		
		return valid
    }
}
