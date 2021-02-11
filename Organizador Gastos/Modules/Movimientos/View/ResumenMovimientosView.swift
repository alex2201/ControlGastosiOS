//
//  ResumenMovimientosView.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit

class ResumenMovimientosView: UIView {
    
    // MARK: Variables públicas
    let montoTotalLbl = UILabel()
    let tablaMovimientos = UITableView(frame: .zero, style: .insetGrouped)
    let añadirButton = UIBarButtonItem(systemItem: .add)
    
    // MARK: Variables privadas
    private let montoFormatter = StringFormatter.moneyFormatter
    private let toolbar: UIToolbar = UIToolbar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configuración UI
    private func configurarUI() {
        backgroundColor = .white
        layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        
        addSubview(montoTotalLbl)
        addSubview(tablaMovimientos)
        addSubview(toolbar)
        
        configurarMontoLbl()
        configurarTablaMovimientos()
        configurarToolbar()
    }
    
    private func configurarMontoLbl() {
        montoTotalLbl.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        montoTotalLbl.translatesAutoresizingMaskIntoConstraints = false
        montoTotalLbl.text = "N/A"
        
        NSLayoutConstraint.activate([
            montoTotalLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            montoTotalLbl.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
        ])
    }
    
    private func configurarTablaMovimientos() {
        tablaMovimientos.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tablaMovimientos.topAnchor.constraint(equalTo: montoTotalLbl.bottomAnchor, constant: 24),
            tablaMovimientos.leadingAnchor.constraint(equalTo: leadingAnchor),
            tablaMovimientos.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func configurarToolbar() {
        let toolbarItems: [UIBarButtonItem] = [
            UIBarButtonItem.flexibleSpace(),
            añadirButton,
        ]
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.setItems(toolbarItems, animated: false)
        
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: tablaMovimientos.bottomAnchor),
            toolbar.bottomAnchor.constraint(equalTo: bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: Métodos públicos
    func configurar(montoTotal: Double) {
        let montoString = montoFormatter.string(from: NSNumber(value: montoTotal))
        montoTotalLbl.text = "\(montoString ?? "N/A")"
    }
}
