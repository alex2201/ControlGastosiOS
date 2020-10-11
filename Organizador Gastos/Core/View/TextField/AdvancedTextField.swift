//
//  AdavancedTextFieldView.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 12/09/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class AdvancedTextField: UIView, NibLoadable {
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.alpha = 0.0
        }
    }
    @IBOutlet weak var textField: UIToolbarTextField!
    @IBOutlet weak var errorLabel: UILabel! {
        didSet {
            descriptionLabel.alpha = 0.0
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 75)
    }
    
    @IBInspectable var descriptionText: String = "" {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    @IBInspectable var placeholderText: String = "" {
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    @IBInspectable var errorText: String = "" {
        didSet {
            errorLabel.text = errorText
        }
    }
    
    private var validator: TextFieldValidator? {
        didSet {
            textField.delegate = validator
        }
    }
    
    var text: String {
        textField.text ?? ""
    }
    
    var isValid: Bool {
        set {
            textField.isValid = newValue
        }
        get {
            textField.isValid
        }
    }
    
    func configure(validator: TextFieldValidator) {
        self.validator = validator
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
        setup()
    }
    
    private func setup() {
        invalidateIntrinsicContentSize()
    }
    
}

extension AdvancedTextField: TextFieldValidatorDelegate {
    func textFieldValidator(_ textFieldValidator: TextFieldValidator, didValidateFormat content: String, isValid: Bool, forTextField textField: UITextField) {
        
    }
    
    func textFieldValidator(_ textFieldValidator: TextFieldValidator, didValidateContent content: String, isValid: Bool, forTextField textField: UITextField) {
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            [weak self] in
            guard let self = self else { return }
            
            self.errorLabel.alpha = isValid ? 0.0 : 1.0
            self.descriptionLabel.alpha = content.count > 0 ? 1.0 : 0.0
        }
        animator.startAnimation()
    }
}
