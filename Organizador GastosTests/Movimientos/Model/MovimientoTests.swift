//
//  MovimientoTests.swift
//  Organizador GastosTests
//
//  Created by Alexander Lopez Cedillo on 11/02/21.
//

import XCTest
import CoreData
@testable import Organizador_Gastos

class MovimientoTests: XCTestCase {
    
    var persistentContainer: NSPersistentContainer!
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    override func setUpWithError() throws {
        persistentContainer = crearContenedorEnMemoria()
    }
    
    override func tearDownWithError() throws {
        persistentContainer = nil
    }
    
    func test_CreacionContainer_NoTieneMovimientos() throws {
        let movimientosDB = try obtenerMovimientosDB()
        
        XCTAssertEqual(movimientosDB.count, 0)
    }
    
    func test_Container_GuardaDatosDummy() throws {
        let movimientos = Movimiento.dummySet()
        let expectacion = expectation(description: "Espera a guardar cambios en DB.")
        
        Movimiento.guardarMovimientosEnDB(movimientos: movimientos, usando: context) { (error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                let movimientosDB = (try? self.obtenerMovimientosDB()) ?? []
                XCTAssertEqual(movimientos.count, movimientosDB.count)
            }
            
            expectacion.fulfill()
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_Container_CargaDatosDummyDesdeDB() throws {
        let movimientos = Movimiento.dummySet()
        let expectacion = expectation(description: "Espera a guardar cambios en DB.")
        
        Movimiento.guardarMovimientosEnDB(movimientos: movimientos, usando: context) { (error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                let movimientosDB = (try? self.obtenerMovimientosDB()) ?? []
                XCTAssertEqual(movimientos.count, movimientosDB.count)
                
                Movimiento.cargarDesdeDB(usando: self.context) { (movimientosDBMetodo) in
                    XCTAssertEqual(movimientosDBMetodo.count, movimientosDB.count)
                    XCTAssertEqual(movimientosDBMetodo, movimientosDB.map({ Movimiento(movimiento: $0) }))
                    expectacion.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
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
    
    private func obtenerMovimientosDB() throws -> [MovimientoDB] {
        let fetchReq: NSFetchRequest<MovimientoDB> = MovimientoDB.fetchRequest()
        let movimientosDB = try context.fetch(fetchReq)
        return movimientosDB
    }
    
}
