//
//  NuevoMovimientoBR.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 04/11/20.
//

import Foundation

class NuevoMovimientoBR {
    
    var descripcion: String?
    var fecha: Date?
    var monto: Date?
    
    // MARK: - Defaults
    var fechaPorDefecto: Date { Date() }
    
    // MARK: - Títulos
    
    // MARK: - Mensajes Error
    
    // MARK: - Validaciones
    var puedeGuardarMovimiento: Bool {
        return descripcion != nil
            && fecha != nil
            && monto != nil
    }
    
}
