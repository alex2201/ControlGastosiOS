//
//  UIViewControllerExtension.swift
//  appNissanImperioSwift
//
//  Created by Alexander Lopez Cedillo on 17/10/20.
//

import UIKit

extension UIViewController {
    
    func add(child: UIViewController, intoContainer container: UIView) {
        let frame = CGRect(origin: .zero, size: container.frame.size)
        // Agregar nuevo controlador
        container.addSubview(child.view)
        self.addChild(child)
        child.didMove(toParent: self)
        
        // Configurar frame de vista de nuevo controlador
        child.view.frame = frame
    }
    
    func remove(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    func dismissKeyboardWhenTapped(){
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}
