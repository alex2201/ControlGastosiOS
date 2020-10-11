//
//  Storyboarded.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 10/10/20.
//

import UIKit

protocol Storyboarded: UIViewController {
    static func instantiate(forStoryboard storyboardName: String) -> Self
}

extension Storyboarded {
    static func instantiate(forStoryboard storyboardName: String) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
