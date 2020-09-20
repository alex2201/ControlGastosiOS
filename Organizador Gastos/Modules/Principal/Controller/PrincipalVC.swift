//
//  PrincipalVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 20/09/20.
//

import UIKit

class PrincipalVC: UIViewController {
    
    
    @IBAction func añadirButtonAction(_ sender: Any) {
        let actions = [
            UIAlertAction(
                title: "Categoría",
                style: .default,
                handler: { _ in 
                    self.performSegue(withIdentifier: "goToCrearCategoria", sender: self)
                }
            ),
            UIAlertAction(
                title: "Cancelar",
                style: .cancel,
                handler: nil
            ),
        ]
        let alert = AlertBuilder.getActionsAlert(
            title: "Añadir",
            message: "Elija una opción.",
            actions: actions
        )
        present(alert, animated: true)
    }
    
}
