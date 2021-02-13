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
    func printDescription(indent: Int)
}

extension Coordinator {
    var navigationController: UINavigationController? {
        controller as? UINavigationController
    }
    var tabBarController: UITabBarController? {
        controller as? UITabBarController
    }
    
    func add(_ child: Coordinator){
        print("<-Add")
        print("Coordinator: \(type(of: self))")
        print("Adding child coordinator...")
        print("\(type(of: child))")
        childCoordinators.append(child)
        child.parentCoordinator = self
        print("Child count: \(childCoordinators.count)")
        print("Add->")
    }
    
    func remove(_ child: Coordinator) {
        print("<-Remove")
        print("Coordinator: \(type(of: self))")
        print("Removing child coordinator...")
        print("\(type(of: child))")
        childCoordinators.removeAll(where: { $0 == child })
        print("Child count: \(childCoordinators.count)")
        print("Remove->")
    }
    
    func finish(completion: (() -> Void)? = nil) {
        parentCoordinator?.remove(self)
    }
    
    func printDescription(indent: Int = 0) {
        print("<\(String(repeating: "-", count: (indent + 1) * 2))")
        print("Coordinator: \(type(of: self))")
        print(self)
        if childCoordinators.count > 0 {
            print("Childs:")
            for child in self.childCoordinators {
                child.printDescription(indent: indent + 1)
            }
        } else {
            print("No childs")
        }
        print("\(String(repeating: "-", count: (indent + 1) * 2))>")
    }
}
