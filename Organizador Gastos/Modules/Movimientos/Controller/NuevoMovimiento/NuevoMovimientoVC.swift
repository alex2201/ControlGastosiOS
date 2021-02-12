//
//  RegistroMovimientoVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit

class NuevoMovimientoVC: UIViewController {
    
    let nuevoMovimientoView = NuevoMovimientoView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        title = "Nuevo Movimiento"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nuevoMovimientoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nuevoMovimientoView)
        
        NSLayoutConstraint.activate([
            nuevoMovimientoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nuevoMovimientoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nuevoMovimientoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            nuevoMovimientoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
