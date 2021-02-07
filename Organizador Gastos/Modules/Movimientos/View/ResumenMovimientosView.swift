//
//  ResumenMovimientosView.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit

class ResumenMovimientosView: UIView {
    
    let montoTotalLbl = UILabel()
    
    private let montoFormatter = StringFormatter.moneyFormatter
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func configurarUI() {
        backgroundColor = .white
        
        montoTotalLbl.center = center
        montoTotalLbl.sizeToFit()
    }
    
    func configurar(montoTotal: Double) {
        montoTotalLbl.text = montoFormatter.string(from: NSNumber(value: montoTotal))
    }
}
