//
//  MovimientosCoordinatorTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez on 06/02/21.
//

import XCTest
@testable import Organizador_Gastos

class MovimientosCoordinatorTests: XCTestCase {
    
    var sut: MovimientosCoordinator!

    override func setUpWithError() throws {
        sut = MovimientosDefaultCoordinator()
        sut.start()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_MovimientosCoordinator_Creacion_ControladorEsTipoNavigation() {
        XCTAssertNotNil(sut.navigationController)
    }
    
    func test_MovimientosCoordinator_Inicio_ControladorActualEsResumenMovimientos() {
        XCTAssertNotNil(sut.navigationController?.viewControllers.last as? ResumenMovimientosVC, "El controlador actual debe ser ResumenMovimientos.")
    }
    
//    func test_MovimientosCoordinator_RegistrarMovimiento_ControladorActualEsRegistroMovimiento() {
//        sut.registrarMovimiento()
//        
//        XCTAssertNotNil(sut.navigationController?.viewControllers.last as? NuevoMovimiento, "El controlador actual debe ser RegistroMovimientoVC.")
//    }
//    
//    func test_MovimientosCoordinator_VolverAlInicioDespuesDeRegistrarMovimiento_ControladorActualEsResumenMovimientos() {
//        sut.registrarMovimiento()
//        sut.volverAlInicio()
//        
//        XCTAssertNotNil(sut.navigationController?.viewControllers.last as? ResumenMovimientosVC, "El controlador actual debe ser ResumenMovimientos.")
//    }

}
