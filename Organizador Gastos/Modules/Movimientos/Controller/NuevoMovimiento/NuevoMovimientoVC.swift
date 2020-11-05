//
//  NuevoMovimientoVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 11/10/20.
//

import UIKit

class NuevoMovimientoVC: BaseViewController, Storyboarded {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descripcionTextField: UIToolbarTextField!
    @IBOutlet weak var montoTextField: UIToolbarTextField!
    
    weak var coordinator: MovimientosCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        keyboardScrollView = scrollView
    }
    
    @IBAction func listoButtonAction(_ sender: Any) {
        
    }
    
    private func setup() {
        descripcionTextField.validator = TextFieldValidator(
            formatValidator: DefaultStringValidator(),
            contentValidator: NotEmptyStringValidator()
        )
        
        montoTextField.validator = TextFieldValidator(
            formatValidator: DecimalStringValidator(),
            contentValidator: LogicalStringValidator(
                firstValidator: NotEmptyStringValidator(),
                secondValidator: DecimalStringValidator(),
                operation: .and
            )
        )
    }
}
