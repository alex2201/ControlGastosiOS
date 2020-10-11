//
//  NuevoMovimientoVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 11/10/20.
//

import UIKit

class NuevoMovimientoVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var descripcionTextField: AdvancedTextField!
    @IBOutlet weak var fechaTextField: AdvancedTextField!
    @IBOutlet weak var montoTextField: AdvancedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func listoButtonAction(_ sender: Any) {
        
    }
    
    private func setup() {
        descripcionTextField.configure(
            validator: TextFieldValidator(
                formatValidator: SentenceSequenceStringValidator(),
                contentValidator: NotEmptyStringValidator())
        )
    }
    
}
