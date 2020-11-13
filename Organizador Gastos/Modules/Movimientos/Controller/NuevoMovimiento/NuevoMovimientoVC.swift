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
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var coordinator: MovimientosCoordinator?
    let br = NuevoMovimientoBR()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        keyboardScrollView = scrollView
    }
    
    @IBAction func listoButtonAction(_ sender: Any) {
        br.fecha = datePicker.date
        if br.puedeGuardarMovimiento {
            
        } else {
            coordinator?.presentErrorAlert(message: br.noPuedeGuardarMovimiento)
        }
    }
    
    @IBAction func textFieldValueChanged(_ sender: UIToolbarTextField) {
        if sender == descripcionTextField {
            br.descripcion = descripcionTextField.isValid ? descripcionTextField.text : nil
        } else if sender == montoTextField {
            br.monto = montoTextField.isValid ? Double(montoTextField.text!) : nil
        }
        print(sender.text ?? "No text")
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
