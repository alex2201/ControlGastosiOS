//
//  Movimiento.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import Foundation

struct Movimiento: Hashable {
    let descripcion: String
    let monto: Double
    let fecha: Date
    
    static func dummySet() -> [Movimiento] {
        let dateFormat = "dd/MM/yyyy"
        return [
            Movimiento(
                descripcion: "Descripción del movimiento 1",
                monto: 523.25,
                fecha: Date.fromString("23/01/2021", usingFormat: dateFormat)!
            ),
            Movimiento(
                descripcion: "Descripción del movimiento 2",
                monto: 523.25,
                fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
            ),
            Movimiento(
                descripcion: "Descripción del movimiento 1",
                monto: 523.25,
                fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
            ),
            Movimiento(
                descripcion: "Descripción del movimiento 1",
                monto: 523.25,
                fecha: Date.fromString("12/02/2021", usingFormat: dateFormat)!
            ),
        ]
    }
}
