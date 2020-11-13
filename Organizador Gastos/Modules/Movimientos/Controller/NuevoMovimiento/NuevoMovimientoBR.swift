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
    var monto: Double?
    
    // MARK: - Defaults
    var fechaPorDefecto: Date { Date() }
    
    // MARK: - Títulos
    
    // MARK: - Mensajes Error
    var noPuedeGuardarMovimiento: String { "Debe llenar todos los campos requeridos." }
    
    // MARK: - Validaciones
    var puedeGuardarMovimiento: Bool {
        return descripcion != nil
            && fecha != nil
            && monto != nil
    }
    
}
