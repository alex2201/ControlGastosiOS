//
//  ResumenMovimientosInteractorTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez Cedillo on 18/02/21.
//

import XCTest
import CoreData
@testable import Organizador_Gastos

class ResumenMovimientosInteractorTests: XCTestCase {
    
    var sut: ResumenMovimientosInteractor?
    var mockPresenter: ResumenMovimientosPresenterMock?
    var fakePersistentContainer: NSPersistentContainer!
    var context: NSManagedObjectContext {
        fakePersistentContainer.viewContext
    }
    
    private let dateFormat = "dd/MM/yyyy"
    
    override func setUpWithError() throws {
        fakePersistentContainer = crearContenedorEnMemoria()
        sut = ResumenMovimientosInteractor(context: context)
        mockPresenter = ResumenMovimientosPresenterMock()
        
        sut?.presenter = mockPresenter
    }
    
    override func tearDownWithError() throws {
        fakePersistentContainer = nil
        sut = nil
        mockPresenter = nil
    }
    
    func test_ResumenMovimientosInteractor_Configuracion_ConfiguracionCorrecta() throws {
        
        sut?.obtenerMovimientos()
        
        XCTAssertNotNil(sut?.presenter)
    }
    
    func test_ResumenMovimientosInteractor_CuandoNoHayMovimientos_ObtieneCeroMovimientos() throws {
        
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        mockPresenter?.cambioEstado = {
            
            XCTAssertNil(self.mockPresenter?.error)
            XCTAssertNotNil(self.mockPresenter?.movimientos)
            XCTAssertEqual(self.mockPresenter?.movimientos?.count, 0)
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos()
        
        XCTAssertNotNil(sut?.presenter)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoMovimientos_ObtieneMismoNumeroMovimientosDummySet() {
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(self.mockPresenter?.movimientos?.count, movimientosPruebas.count)
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos()
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientos_ObtieneMismosMovimientos() {
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(Set(self.mockPresenter!.movimientos!), Set(movimientosPruebas))
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos()
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientosDespuesDeFechaInicial_EncuentraMovimientos() {
        let fechaInicial = Date.fromString("19/01/2021", usingFormat: dateFormat)!
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(Set(self.mockPresenter!.movimientos!), Set(movimientosPruebas.filter({ $0.fecha >= fechaInicial })))
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(despuesDe: fechaInicial)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientosAntesDeFechaInicial_EncuentraCeroMovimientos() {
        let fechaInicial = Date.fromString("19/01/2022", usingFormat: dateFormat)!
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(self.mockPresenter!.movimientos!.count, 0)
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(despuesDe: fechaInicial)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientosAntesDeFechaFinal_EncuentraMovimientos() {
        let fechaFinal = Date.fromString("12/02/2021", usingFormat: dateFormat)!
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(Set(self.mockPresenter!.movimientos!), Set(movimientosPruebas.filter({ $0.fecha <= fechaFinal })))
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(antesDe: fechaFinal)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientosDespuesDeFechaFinal_EncuentraCeroMovimientos() {
        let fechaFinal = Date.fromString("19/01/2019", usingFormat: dateFormat)!
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(self.mockPresenter!.movimientos!.count, 0)
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(antesDe: fechaFinal)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientos_EncuentraMovimientosDentroDelRangoDeFechas() {
        let fechaInicial = Date.fromString("19/01/2019", usingFormat: dateFormat)!
        let fechaFinal = Date.fromString("19/01/2020", usingFormat: dateFormat)!
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(Set(self.mockPresenter!.movimientos!), Set(movimientosPruebas.filter({ $0.fecha >= fechaInicial && $0.fecha <= fechaFinal })))
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(despuesDe: fechaInicial, antesDe: fechaFinal)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_ResumenMovimientosInteractor_CuandoTieneMovimientos_EncuentraMovimientosQueContenganDescripcion() {
        let descripcion = "macbook"
        let obtenerMovimientosExpectation = expectation(description: "ObtenerMovimientos")
        let movimientosPruebas = MovimientoEntity.dummySet()
        guardarMovimientosEnDB(movimientos: movimientosPruebas, usando: context)
        mockPresenter?.cambioEstado = {
            
            XCTAssertEqual(Set(self.mockPresenter!.movimientos!), Set(movimientosPruebas.filter({ $0.descripcion.lowercased().contains(descripcion.lowercased()) })))
            
            obtenerMovimientosExpectation.fulfill()
        }
        
        sut?.obtenerMovimientos(conDescripcion: descripcion)
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    // MARK: - Helpers
    private func guardarMovimientosEnDB(movimientos: [MovimientoEntity], usando context: NSManagedObjectContext) {
        context.perform {
            do {
                movimientos
                    .forEach({ movimiento in
                        let movimientoDB = MovimientoDB(context: context)
                        movimientoDB.descripcion = movimiento.descripcion
                        movimientoDB.monto = movimiento.monto
                        movimientoDB.fecha = movimiento.fecha
                    })
                try context.save()
            } catch {
                
            }
        }
    }
    
    class ResumenMovimientosPresenterMock: ResumenMovimientosInteractorToPresenterProtocol {
        
        var error: String?
        var movimientos: [MovimientoEntity]?
        var cambioEstado: (() -> Void)?
        
        func interactor(recibioMovimientos movimientos: [MovimientoEntity]) {
            self.movimientos = movimientos
            cambioEstado?()
        }
        
        func interactor(recibioError error: String) {
            self.error = error
            cambioEstado?()
        }
    }
    
    private func crearContenedorEnMemoria() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "Organizador_Gastos")
        
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Failed to load stores: \(error), \(error.userInfo)")
            }
        })
        
        return container
    }
    
}
