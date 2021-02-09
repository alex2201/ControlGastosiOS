//
//  ResumenMovimientosModel.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 09/02/21.
//

import Foundation

struct ResumenMovimientosModel {
    typealias SeccionFecha = String
    
    // MARK: Variables públicas
    var movimientosPorSeccion: [SeccionFecha: [Movimiento]] = [:]
    var secciones: [SeccionFecha] = []
    
    // MARK: Variables privadas
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    mutating func configurar(con movimientos: [Movimiento]) {
        secciones = generarSeccionesPorFecha(usando: movimientos)
        movimientosPorSeccion = generarMovimientosPorSeccions(usandoSecciones: secciones, para: movimientos)
    }
    
    private func generarSeccionesPorFecha(usando movimientos: [Movimiento]) -> [SeccionFecha] {
        return Set(movimientos
            .map({$0.fecha}))
            .sorted(by: { $0 > $1 })
            .map({ dateFormatter.string(from: $0) })
    }
    
    private func generarMovimientosPorSeccions(usandoSecciones secciones: [SeccionFecha], para movimientos: [Movimiento]) -> [SeccionFecha: [Movimiento]] {
        var movimientosPorSeccion: [SeccionFecha: [Movimiento]] = [:]
        
        for seccion in secciones {
            movimientosPorSeccion[seccion] = movimientos
                .filter({ movimiento in
                    let seccionFecha = dateFormatter.string(from: movimiento.fecha)
                    return seccionFecha == seccion
                })
        }
        
        return movimientosPorSeccion
    }
}
