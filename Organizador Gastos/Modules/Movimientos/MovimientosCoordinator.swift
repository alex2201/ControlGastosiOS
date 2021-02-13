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
        let contenedor = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        let view = ResumenMovimientosView()
        let vc = ResumenMovimientosVC(view: view, contenedor: contenedor)
        vc.coordinator = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func registrarMovimiento() {
        let view = NuevoMovimientoView()
        let vc = NuevoMovimientoVC(view: view)
        let navigationController = NavigationController(rootViewController: vc)
        
        controller.present(navigationController, animated: true)
    }
    
    func volverAlInicio(animated: Bool = false) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
}
