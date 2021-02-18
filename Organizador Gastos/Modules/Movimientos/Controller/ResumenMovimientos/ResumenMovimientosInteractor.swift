//
//  ResumenMovimientosInteractor.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 18/02/21.
//

import Foundation
import CoreData

class ResumenMovimientosInteractor: ResumenMovimientosPresenterToInteractorProtocol {
    // MARK: - Variables publicas
    weak var presenter: ResumenMovimientosInteractorToPresenterProtocol?
    
    // MARK: - Variables privadas
    private let context: NSManagedObjectContext
    
    // MARK: - Métodos públicos
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func obtenerMovimientos(despuesDe fechaInicio: Date?, antesDe fechaFin: Date?, conDescripcion descripcion: String?) {
        context.perform {
            [weak self] in
            guard let self = self else { return }
            
            let request: NSFetchRequest<MovimientoDB> = MovimientoDB.fetchRequest()
            let predicates = [
                fechaInicio != nil ? NSPredicate(format: "fecha >= %@", argumentArray: [fechaInicio!]) : nil,
                fechaFin != nil ? NSPredicate(format: "fecha <= %@", argumentArray: [fechaFin!]) : nil,
                descripcion != nil ? NSPredicate(format: "descripcion CONTAINS[c] %@", argumentArray: [descripcion!]) : nil,
            ].compactMap({ $0 })
            
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

            do {
                let movimientos = try self.context
                    .fetch(request)
                    .map({ MovimientoEntity(movimiento: $0) })
                
                self.presenter?.interactor(recibioMovimientos: movimientos)
            } catch {
                print(error)
                self.presenter?.interactor(recibioError: error.localizedDescription )
            }
        }
    }
    
    // MARK: - Métodos privados
    
}
