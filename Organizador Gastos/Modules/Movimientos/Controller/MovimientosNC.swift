//
//  MovimientosNC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import UIKit

class MovimientosNC: NavigationController {
    
    weak var coordinator: MovimientosCoordinator?
    
    override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
