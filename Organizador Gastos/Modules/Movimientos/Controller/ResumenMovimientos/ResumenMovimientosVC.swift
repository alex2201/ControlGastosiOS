//
//  ResumenMovimientosVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit

class ResumenMovimientosVC: UIViewController {
    weak var coordinator: MovimientosCoordinator?
    
    let resumenView: ResumenMovimientosView
    
    init(view: ResumenMovimientosView) {
        self.resumenView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resumenView)
        
        resumenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resumenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resumenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            resumenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resumenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        resumenView.configurar(montoTotal: 400)
    }
}
