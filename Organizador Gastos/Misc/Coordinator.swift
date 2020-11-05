//
//  Coordinator.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 10/10/20.
//

import UIKit

protocol Coordinator: NSObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var controller: UIViewController { get }
    var navigationController: UINavigationController? { get }
    var tabBarController: UITabBarController? { get }
    
    func start()
    func finish(completion: (() -> Void)?)
    func add(_ child: Coordinator)
    func remove(_ child: Coordinator)
    func presentErrorAlert(message: String)
}

extension Coordinator {
    var navigationController: UINavigationController? {
        controller as? UINavigationController
    }
    var tabBarController: UITabBarController? {
        controller as? UITabBarController
    }
    
    func add(_ child: Coordinator){
        print("------Coordinator add before")
        print(childCoordinators.count)
        childCoordinators.append(child)
        child.parentCoordinator = self
        print("------Coordinator add after")
        print(childCoordinators.count)
    }
    
    func remove(_ child: Coordinator) {
        print("------Coordinator remove before")
        print(childCoordinators.count)
        childCoordinators.removeAll(where: { $0 == child })
        print("------Coordinator remove after")
        print(childCoordinators.count)
    }
    
    func presentErrorAlert(message: String) {
        let alert = AlertBuilder.getMessageAlert(title: "Aviso", message: message)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func finish(completion: (() -> Void)? = nil) {
        parentCoordinator?.remove(self)
    }
}
