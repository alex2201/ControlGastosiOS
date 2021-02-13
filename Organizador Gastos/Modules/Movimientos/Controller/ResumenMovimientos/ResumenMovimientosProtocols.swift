//
//  ResumenMovimientosProtocols.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 13/02/21.
//

import Foundation

import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterResumenMovimientosProtocol: ViewToPresenterProtocol {
    
    var view: PresenterToViewResumenMovimientosProtocol? { get set }
    var interactor: PresenterToInteractorResumenMovimientosProtocol? { get set }
    var coordinator: MovimientosCoordinator? { get set }
    
    func obtenerMovimientos()
}

class PresenterMock: ViewToPresenterResumenMovimientosProtocol {

    var view: PresenterToViewResumenMovimientosProtocol?
    var interactor: PresenterToInteractorResumenMovimientosProtocol?
    var coordinator: MovimientosCoordinator?
    
    func obtenerMovimientos() {
        coordinator?.registrarMovimiento()
    }
    
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewResumenMovimientosProtocol: PresenterToViewProtocol {
    func presentar(movimientos: [MovimientoEntity])
    func presentarIndicadorCarga(completion: (() -> Void)?)
    func ocultarIndicadorCarga(completion: (() -> Void)?)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorResumenMovimientosProtocol: PresenterToInteractorProtocol {
    var presenter: InteractorMovimientosToPresenterProtocol? { get set }
    
    func obtenerMovimientos(de fechaInicio: Date?, a fechaFin: Date?, conDescripcion descripcion: String?)
    func guardar(movimiento: MovimientoEntity)
}

extension PresenterToInteractorResumenMovimientosProtocol {
    func obtenerMovimientos() {
        obtenerMovimientos(de: nil, a: nil, conDescripcion: nil)
    }
    
    func obtenerMovimientos(de fechaInicio: Date, a fechaFin: Date) {
        obtenerMovimientos(de: fechaInicio, a: fechaFin, conDescripcion: nil)
    }
    
    func obtenerMovimientos(conDescripcion descripcion: String) {
        obtenerMovimientos(de: nil, a: nil, conDescripcion: descripcion)
    }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorMovimientosToPresenterProtocol {
    func interactor(resultadoObtenerMovimientos resultado: Result<[MovimientoEntity], Error>)
}
