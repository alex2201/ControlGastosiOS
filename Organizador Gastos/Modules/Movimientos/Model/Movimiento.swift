//
//  Movimiento.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import Foundation
import CoreData

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
    
    static func cargarDesdeDB(usando context: NSManagedObjectContext, completion: @escaping ([Movimiento]) -> Void) {
        context.perform {
            let movimientos: [Movimiento]
            let request: NSFetchRequest<MovimientoDB> = MovimientoDB.fetchRequest()
            
            do {
                let movimientosDB = try context.fetch(request)
                movimientos = movimientosDB
                    .map({ Movimiento(movimiento: $0) })
            } catch {
                print(error.localizedDescription)
                movimientos = []
            }
            
            completion(movimientos)
        }
    }
}

extension Movimiento {
    init(movimiento: MovimientoDB) {
        self.init(
            descripcion: movimiento.descripcion!,
            monto: movimiento.monto,
            fecha: movimiento.fecha!
        )
    }
}
