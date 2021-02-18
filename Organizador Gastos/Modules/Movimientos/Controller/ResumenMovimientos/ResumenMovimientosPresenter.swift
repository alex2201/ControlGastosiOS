//
//  ResumenMovimientosPresenter.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 18/02/21.
//

import Foundation

class ResumenMovimientosPresenter: ViewToPresenterResumenMovimientosProtocol, ResumenMovimientosInteractorToPresenterProtocol {
    
    // MARK: - Variables publicas
    var view: PresenterToViewResumenMovimientosProtocol?
    var interactor: ResumenMovimientosPresenterToInteractorProtocol?
    weak var coordinator: MovimientosCoordinator?
    
    // MARK: - Variables privadas
    
    // MARK: - Métodos públicos
    func obtenerMovimientos() {
        
    }
    
    func nuevoMovimiento() {
        
    }
    
    // MARK: - Interactor
    func interactor(recibioMovimientos movimientos: [MovimientoEntity]) {
        
    }
    
    func interactor(recibioError error: String) {
        
    }
    
    // MARK: - Métodos privados
    
}
