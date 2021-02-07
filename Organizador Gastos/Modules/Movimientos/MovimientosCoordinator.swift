//
//  MovimientosCoordinator.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import UIKit

class MovimientosCoordinator: NSObject, Coordinator {
        
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var controller: UIViewController
    
    override init() {
        let vc = MovimientosNC()
        controller = vc
        super.init()
        vc.coordinator = self
    }
    
    func start() {
        let vc = ResumenMovimientosVC()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func registrarMovimiento() {
        let vc = RegistroMovimientoVC()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func volverAlInicio(animated: Bool = false) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
}
