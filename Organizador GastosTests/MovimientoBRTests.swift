//
//  MovimientoTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez on 06/02/21.
//

import XCTest
@testable import Organizador_Gastos

class MovimientoBRTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MovimientoBR_NoTieneDatos_NoPuedeGenerarMovimiento() throws {
        let sut = MovimientoBR()
        
        XCTAssertFalse(sut.puedeGenerarMovimiento)
    }
    
    func test_MovimientoBR_TieneDatos_PuedeGenerarMovimiento() {
        let sut = MovimientoBR()
        
        sut.descripcion = "Descripcion"
        sut.fecha = Date()
        sut.monto = 0.0
        
        XCTAssertTrue(sut.puedeGenerarMovimiento)
    }

}
