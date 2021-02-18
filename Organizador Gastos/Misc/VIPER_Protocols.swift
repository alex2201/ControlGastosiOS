//
//  Presenter.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 13/02/21.
//

import UIKit

// MARK: - ViewToPresenterProtocol (View -> Presenter)
protocol ViewToPresenterProtocol {
    associatedtype V
    associatedtype I
    associatedtype C
    
    var view: V? { get set }
    var interactor: I? { get set }
    var coordinator: C? { get set }
}

// MARK: - PresenterToViewProtocol (Presenter -> View)
protocol PresenterToViewProtocol: UIViewController {
    func presentar(aviso: String)
}

extension PresenterToViewProtocol {
    func presentar(aviso: String) {
        let alert = AlertBuilder.getMessageAlert(title: "Aviso", message: aviso)
        self.present(alert, animated: true)
    }
}

// MARK: - PresenterToInteractorProtocol (Presenter -> Interactor)
protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
}

// MARK: - InteractorMovimientosToPresenterProtocol (Interactor -> Presenter)
protocol InteractorToPresenterProtocol {
    
}
