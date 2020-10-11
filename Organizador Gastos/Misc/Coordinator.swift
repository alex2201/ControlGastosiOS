//
//  Coordinator.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 10/10/20.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
