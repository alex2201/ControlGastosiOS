//
//  ResumenMovimientosViewTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez on 06/02/21.
//

import XCTest
@testable import Organizador_Gastos

class ResumenMovimientosViewTests: XCTestCase {
    
    var sut: ResumenMovimientosView!

    override func setUpWithError() throws {
        sut = ResumenMovimientosView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}