//
//  UIToolbarTextField.swift
//
//
//  Created by Alexander Lopez Cedillo on 01/06/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

protocol ErrorDisplay {
	func displayError()
	func hideError()
}

class UIToolbarTextField: DesignableUITextField, ErrorDisplay {
    
    typealias Action = () -> Void
    
    var isValid = false
	private var doneAction: Action!
	private var cancelAction: Action!
	var validator: TextFieldValidator? {
		set {
			self.delegate = newValue
		}
		get {
			return self.delegate as? TextFieldValidator
		}
	}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addDoneCancelToolbar(target: self, doneAction: #selector(donePressed), cancelAction: #selector(cancelPressed))
		doneAction = { [weak self] in
			self?.endEditing(true)
		}
		cancelAction = { [weak self] in
            self?.text = ""
			self?.endEditing(true)
		}
    }
    
    func setToolbarActions(doneAction: @escaping Action, cancelAction: @escaping Action) {
        self.doneAction = doneAction
        self.cancelAction = cancelAction
    }
    
    @objc func donePressed(){
        doneAction()
    }
    
    @objc func cancelPressed(){
        cancelAction()
    }
	
	func displayError() {
		layer.borderColor = UIColor.red.cgColor
		layer.borderWidth = 3.0
		layer.cornerRadius = 10.0
        isValid = false
	}
	
	func hideError() {
		layer.borderColor = nil
		layer.borderWidth = 0.0
        isValid = true
	}
	
}

private extension UIToolbarTextField {
	func addDoneCancelToolbar(target: Any, doneAction: Selector, cancelAction: Selector) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: doneAction)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: target, action: cancelAction)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        self.inputAccessoryView = toolBar
    }
}
