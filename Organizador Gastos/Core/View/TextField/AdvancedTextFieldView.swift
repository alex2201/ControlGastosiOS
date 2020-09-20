//
//  AdavancedTextFieldView.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 12/09/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

@IBDesignable
class AdvancedTextFieldView: UIView, NibLoadable {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
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
