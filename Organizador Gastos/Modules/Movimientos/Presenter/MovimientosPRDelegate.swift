//
//  MovimientosPRDelegate.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import Foundation

protocol MovimientosPRDelegate: AnyObject {
    func presenter(_ presenter: MovimientosPR, didReceiveErrorMessage errorMessage: String)
}
