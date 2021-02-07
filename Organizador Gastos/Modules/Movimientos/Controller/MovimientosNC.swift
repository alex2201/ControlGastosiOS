//
//  MovimientosNC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import UIKit

class MovimientosNC: UINavigationController {
    
    weak var coordinator: MovimientosCoordinator?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.finish()
    }
}
