//
//  MovimientoBR.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import Foundation

class MovimientoBR {
    // MARK: Variables públicas
    var descripcion: String?
    var fecha: Date?
    var monto: Double?
    
    // MARK: Validaciones
    var puedeGenerarMovimiento: Bool {
        return descripcion != nil
            && fecha != nil
            && monto != nil
    }
    
    // MARK: Funciones públicas
    
    
}
