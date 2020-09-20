//
//  TextFieldValidator.swift
//  appautofin
//
//  Created by Alexander Lopez on 09/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import UIKit

class TextFieldValidator: NSObject, UITextFieldDelegate {
	
	private let formatValidator: StringValidator
	private let contentValidator: StringValidator?
	var validator: TextFieldValidator?
	var delegate: TextFieldValidatorDelegate?
	var shouldFocusNextOnReturn: Bool = true
	
	init(formatValidator: StringValidator, contentValidator: StringValidator?) {
		self.formatValidator = formatValidator
		self.contentValidator = contentValidator
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let errorDisplay = textField as? ErrorDisplay
		let currentText = textField.text ?? ""
		let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
		
		let validFormat = formatValidator.validate(string: replacementText)
		
		if validFormat {
			let validContent = contentValidator?.validate(string: replacementText) ?? true
			if validContent {
				errorDisplay?.hideError()
			} else {
				errorDisplay?.displayError()
			}
			
			delegate?.textFieldValidator(self, didValidateContent: replacementText, isValid: validContent, forTextField: textField)
		}
		
		delegate?.textFieldValidator(self, didValidateContent: replacementText, isValid: validFormat, forTextField: textField)
		
		return validFormat
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		let text = textField.text ?? ""
		let validContent = contentValidator?.validate(string: text) ?? true
		delegate?.textFieldValidator(self, didValidateContent: text, isValid: validContent, forTextField: textField)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		let nextTag = textField.tag + 1
		
		if shouldFocusNextOnReturn, let nextResponder = textField.superview?.viewWithTag(nextTag) {
			nextResponder.becomeFirstResponder()
		}
		
		return true
	}
	
}

protocol TextFieldValidatorDelegate: class {
	
	func textFieldValidator(_ textFieldValidator: TextFieldValidator, didValidateContent content: String, isValid: Bool, forTextField textField: UITextField)
	func textFieldValidator(_ textFieldValidator: TextFieldValidator, didValidateFormat content: String, isValid: Bool, forTextField textField: UITextField)
	
}
