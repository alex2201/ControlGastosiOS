//
//  Movimiento.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import Foundation
import CoreData

struct MovimientoEntity: Hashable {
    let descripcion: String
    let monto: Double
    let fecha: Date
    
    func guardarEnDB(usando context: NSManagedObjectContext, completion: @escaping (Error?) -> Void) {
        context.perform {
            let movimientoDB = MovimientoDB(context: context)
            
            movimientoDB.descripcion = self.descripcion
            movimientoDB.monto = self.monto
            movimientoDB.fecha = self.fecha
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
                completion(error)
            }
            
            completion(nil)
        }
    }
    
    static func dummySet() -> [MovimientoEntity] {
        let dateFormat = "dd/MM/yyyy"
        return [
            MovimientoEntity(
                descripcion: "Despensa",
                monto: 523.25,
                fecha: Date.fromString("23/01/2021", usingFormat: dateFormat)!
            ),
            MovimientoEntity(
                descripcion: "Papas",
                monto: 41.23,
                fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
            ),
            MovimientoEntity(
                descripcion: "Barra de sonido",
                monto: 1234.53,
                fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
            ),
            MovimientoEntity(
                descripcion: "Macbook Pro",
                monto: 937512.93,
                fecha: Date.fromString("12/02/2021", usingFormat: dateFormat)!
            ),
        ]
    }
    
    static func cargarDesdeDB(usando context: NSManagedObjectContext, completion: @escaping ([MovimientoEntity]) -> Void) {
        context.perform {
            let movimientos: [MovimientoEntity]
            let request: NSFetchRequest<MovimientoDB> = MovimientoDB.fetchRequest()
            
            do {
                let movimientosDB = try context.fetch(request)
                movimientos = movimientosDB
                    .map({ MovimientoEntity(movimiento: $0) })
            } catch {
                print(error.localizedDescription)
                movimientos = []
            }
            
            completion(movimientos)
        }
    }
    
    static func guardarMovimientosEnDB(movimientos: [MovimientoEntity], usando context: NSManagedObjectContext, completion: @escaping (Error?) -> Void) {
        context.perform {
            do {
                movimientos
                    .forEach({ movimiento in
                        let movimientoDB = MovimientoDB(context: context)
                        movimientoDB.descripcion = movimiento.descripcion
                        movimientoDB.monto = movimiento.monto
                        movimientoDB.fecha = movimiento.fecha
                    })
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
}

extension MovimientoEntity {
    init(movimiento: MovimientoDB) {
        self.init(
            descripcion: movimiento.descripcion!,
            monto: movimiento.monto,
            fecha: movimiento.fecha!
        )
    }
}
