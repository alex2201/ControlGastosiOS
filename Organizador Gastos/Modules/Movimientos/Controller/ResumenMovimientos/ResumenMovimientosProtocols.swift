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
var interactor: PresenterToInteractorResumenMovimientosProtocol? { get set }
var router: PresenterToRouterResumenMovimientosProtocol? { get set }
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewResumenMovimientosProtocol {
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorResumenMovimientosProtocol {
var presenter: InteractorToPresenterResumenMovimientosProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterResumenMovimientosProtocol {
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterResumenMovimientosProtocol {
}
