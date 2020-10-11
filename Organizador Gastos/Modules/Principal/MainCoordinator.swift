//
//  MainCoordinator.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 10/10/20.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    internal init(navigationController: UINavigationController, childCoordinators: [Coordinator] = []) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
    }
    
    func start() {
        let vc = PrincipalVC.instantiate(forStoryboard: "Principal")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToCrearCategoria() {
        
    }
    
    func goToMovimientos() {
        let vc = ListaMovimientosVC.instantiate(forStoryboard: "Movimientos")
        
        navigationController.pushViewController(vc, animated: true)
    }
    
}
