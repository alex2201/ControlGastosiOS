//
//  AlertBuilder.swift
//  SchoolCam
//
//  Created by Alexander Lopez Cedillo on 08/03/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class AlertBuilder {
	typealias Completion = () -> Void
	typealias ValueCompletion = (String) -> Void
	
	static func getMessageAlert(title: String, message: String, completion: Completion?) -> UIAlertController {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Listo", style: .default)
		alert.addAction(action)
		return alert
	}
	
	static func getConfirmationAlert(title: String, message: String, successFunc: Completion?, cancelFunc: Completion?) -> UIAlertController {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
			cancelFunc?()
		}
		let successAction = UIAlertAction(title: "Continuar", style: .default) { _ in
			successFunc?()
		}
		alert.addAction(cancelAction)
		alert.addAction(successAction)
		return alert
	}
	
	static func getDestructiveConfirmationAlert(title: String, message: String, successFunc: Completion?, cancelFunc: Completion?) -> UIAlertController {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive) { _ in
			cancelFunc?()
		}
		let successAction = UIAlertAction(title: "Continuar", style: .default) { _ in
			successFunc?()
		}
		alert.addAction(cancelAction)
		alert.addAction(successAction)
		return alert
	}
	
	static func getActionsAlert(title: String, message: String, actions: [UIAlertAction]) -> UIAlertController {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
		
		for i in 0..<actions.count {
			alert.addAction(actions[i])
		}
		return alert
	}
	
	static func getTextFieldAlert(title: String, message: String, placeholder: String, autoCapitalization: UITextAutocapitalizationType = .words, autoCorrection: UITextAutocorrectionType = .yes, successFunc: ValueCompletion?, cancelFunc: Completion?) -> UIAlertController {
		var alertTextField: UITextField?
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
			cancelFunc?()
		}
		let addAction = UIAlertAction(title: "Listo", style: .default) { (action) in
			let text = alertTextField!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			successFunc?(text)
		}
		alert.addTextField { (textField) in
			textField.placeholder = placeholder
			textField.autocapitalizationType = autoCapitalization
			textField.autocorrectionType = autoCorrection
			alertTextField = textField
		}
		alert.addAction(cancelAction)
		alert.addAction(addAction)
		return alert
	}
	
}
