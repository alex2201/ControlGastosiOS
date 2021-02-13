//
//  Presenter.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 13/02/21.
//

import UIKit

// MARK: - ViewToPresenterProtocol
protocol ViewToPresenterProtocol {
    associatedtype V
    associatedtype I
    associatedtype C
    
    var view: V? { get set }
    var interactor: I? { get set }
    var coordinator: C? { get set }
}

// MARK: - PresenterToViewProtocol
protocol PresenterToViewProtocol: UIViewController {
    func presentar(aviso: String)
}

extension PresenterToViewProtocol {
    func presentar(aviso: String) {
        let alert = AlertBuilder.getMessageAlert(title: "Aviso", message: aviso)
        self.present(alert, animated: true)
    }
}

// MARK: - PresenterToInteractorProtocol
protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
}

// MARK: - InteractorMovimientosToPresenterProtocol
protocol InteractorToPresenterProtocol {
    
}
