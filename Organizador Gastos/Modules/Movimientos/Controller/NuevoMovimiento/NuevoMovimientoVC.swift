//
//  RegistroMovimientoVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit
import Combine

class NuevoMovimientoVC: UIViewController {
    
    private let nuevoMovimientoView: NuevoMovimientoView
    private var subs: [AnyCancellable] = []
    
    init(view: NuevoMovimientoView) {
        self.nuevoMovimientoView = view
        super.init(nibName: nil, bundle: nil)
        title = "Nuevo Movimiento"
        
        configurarNavigationBar()
        configurarNuevoMovimientoView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurarNavigationBar() {
        let listoBtn = UIBarButtonItem(title: "Listo", style: .done, target: self, action: #selector(listoBtnAction))
        navigationItem.rightBarButtonItem = listoBtn
    }
    
    private func configurarNuevoMovimientoView() {
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
    
    @objc private func listoBtnAction() {
        print("Listo presionado.")
    }
}
