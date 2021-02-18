//
//  ResumenMovimientosProtocols.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 13/02/21.
//

import Foundation

import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterResumenMovimientosProtocol {
    
    var view: PresenterToViewResumenMovimientosProtocol? { get set }
    var interactor: ResumenMovimientosPresenterToInteractorProtocol? { get set }
    var coordinator: MovimientosCoordinator? { get set }
    
    func obtenerMovimientos()
    func nuevoMovimiento()
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewResumenMovimientosProtocol: PresenterToViewProtocol, Loadable {
    func presentar(movimientos: [MovimientoEntity])
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol ResumenMovimientosPresenterToInteractorProtocol {
    var presenter: ResumenMovimientosInteractorToPresenterProtocol? { get set }
    
    func obtenerMovimientos(despuesDe fechaInicio: Date?, antesDe fechaFin: Date?, conDescripcion descripcion: String?)
}

extension ResumenMovimientosPresenterToInteractorProtocol {
    func obtenerMovimientos() {
        obtenerMovimientos(despuesDe: nil, antesDe: nil, conDescripcion: nil)
    }
    
    func obtenerMovimientos(de fecha: Date) {
        obtenerMovimientos(despuesDe: fecha, antesDe: fecha, conDescripcion: nil)
    }
    
    func obtenerMovimientos(despuesDe fechaInicio: Date) {
        obtenerMovimientos(despuesDe: fechaInicio, antesDe: nil, conDescripcion: nil)
    }
    
    func obtenerMovimientos(antesDe fechaFin: Date) {
        obtenerMovimientos(despuesDe: nil, antesDe: fechaFin, conDescripcion: nil)
    }
    
    func obtenerMovimientos(despuesDe fechaInicio: Date, antesDe fechaFin: Date) {
        obtenerMovimientos(despuesDe: fechaInicio, antesDe: fechaFin, conDescripcion: nil)
    }
    
    func obtenerMovimientos(conDescripcion descripcion: String) {
        obtenerMovimientos(despuesDe: nil, antesDe: nil, conDescripcion: descripcion)
    }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol ResumenMovimientosInteractorToPresenterProtocol: class {
    func interactor(recibioMovimientos movimientos: [MovimientoEntity])
    func interactor(recibioError error: String)
}
