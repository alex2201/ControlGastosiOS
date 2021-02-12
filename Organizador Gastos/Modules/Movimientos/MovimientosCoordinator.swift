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
//        let contenedor = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//        let view = ResumenMovimientosView()
//        let vc = ResumenMovimientosVC(view: view, contenedor: contenedor)
//        vc.coordinator = self
        let vc = NuevoMovimientoVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func registrarMovimiento() {
        let vc = NuevoMovimientoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func volverAlInicio(animated: Bool = false) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
}
