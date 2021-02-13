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
    var movimientosPorSeccion: [SeccionFecha: [MovimientoEntity]] = [:]
    var secciones: [SeccionFecha] = []
    
    // MARK: Variables privadas
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    // MARK: Métodos públicos
    init(movimientos: [MovimientoEntity] = []) {
        secciones = generarSeccionesPorFecha(usando: movimientos)
        movimientosPorSeccion = generarMovimientosPorSeccions(usandoSecciones: secciones, para: movimientos)
    }
    
    func configurar(con movimientos: [MovimientoEntity]) -> ResumenMovimientosModel {
        return ResumenMovimientosModel(movimientos: movimientos)
    }
    
    // MARK: Métodos privados
    private func generarSeccionesPorFecha(usando movimientos: [MovimientoEntity]) -> [SeccionFecha] {
        return Set(movimientos
                    .map({$0.fecha}))
            .sorted(by: { $0 > $1 })
            .map({ dateFormatter.string(from: $0) })
    }
    
    private func generarMovimientosPorSeccions(usandoSecciones secciones: [SeccionFecha], para movimientos: [MovimientoEntity]) -> [SeccionFecha: [MovimientoEntity]] {
        var movimientosPorSeccion: [SeccionFecha: [MovimientoEntity]] = [:]
        
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
