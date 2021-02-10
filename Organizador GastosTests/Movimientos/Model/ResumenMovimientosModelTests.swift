//
//  ResumenMovimientosModelTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez Cedillo on 09/02/21.
//

import XCTest
@testable import Organizador_Gastos

class ResumenMovimientosModelTests: XCTestCase {
    
    var sut: ResumenMovimientosModel!
    let movimientosMock = Movimiento.dummySet()

    override func setUpWithError() throws {
       sut = ResumenMovimientosModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_CreacionModelo_NoTieneSecciones() {
        XCTAssertEqual(sut.secciones, [])
    }
    
    func test_CreacionModelo_NoTieneMovimientos() {
        XCTAssertEqual(sut.secciones, [])
    }
    
    func test_ConfiguracionModelo_CreaSeccionesOrdenadasPorMasReciente() {
        sut = sut.configurar(con: movimientosMock)
        
        XCTAssertEqual(
            sut.secciones,
            [
                "12/02/2021",
                "23/01/2021",
                "19/01/2021",
            ]
        )
    }
    
    func test_ConfiguracionModelo_CreaMovimientosPorSecciones() {
        let dateFormat = "dd/MM/yyyy"
        
        sut = sut.configurar(con: movimientosMock)
        
        XCTAssertEqual(
            sut.movimientosPorSeccion,
            [
                "12/02/2021": [
                    Movimiento(
                        descripcion: "Descripción del movimiento 1",
                        monto: 523.25,
                        fecha: Date.fromString("12/02/2021", usingFormat: dateFormat)!
                    )
                ],
                "23/01/2021": [
                    Movimiento(
                        descripcion: "Descripción del movimiento 1",
                        monto: 523.25,
                        fecha: Date.fromString("23/01/2021", usingFormat: dateFormat)!
                    ),
                ],
                "19/01/2021": [
                    Movimiento(
                        descripcion: "Descripción del movimiento 2",
                        monto: 523.25,
                        fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
                    ),
                    Movimiento(
                        descripcion: "Descripción del movimiento 1",
                        monto: 523.25,
                        fecha: Date.fromString("19/01/2021", usingFormat: dateFormat)!
                    ),
                ],
            ]
        )
    }

}
