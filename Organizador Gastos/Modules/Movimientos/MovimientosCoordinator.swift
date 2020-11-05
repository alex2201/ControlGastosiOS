//
//  MovimientosCoordinator.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import UIKit

class MovimientosCoordinator: NSObject, Coordinator {
    
    private let storyboard = "Movimientos"
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var controller: UIViewController
    
    override init() {
        let vc = MovimientosNC.instantiate(fromStoryboard: storyboard)
        controller = vc
        super.init()
        vc.coordinator = self
    }
    
    func start() {
        let vc = EstadoActualVC.instantiate(fromStoryboard: storyboard)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func goToCrearCategoria() {
        
    }
    
    func agregarMovimiento() {
        let vc = NuevoMovimientoVC.instantiate(fromStoryboard: storyboard)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
