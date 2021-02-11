//
//  ResumenMovimientosVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 06/02/21.
//

import UIKit
import CoreData

class ResumenMovimientosVC: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<ResumenMovimientosModel.SeccionFecha, Movimiento>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ResumenMovimientosModel.SeccionFecha, Movimiento>
    
    // MARK: - Variables públicas
    weak var coordinator: MovimientosCoordinator?
    let resumenView: ResumenMovimientosView
    
    // MARK: - Variables privadas
    private let contenedorDB: NSPersistentContainer
    private var models: [ResumenMovimientosModel] = []
    private lazy var dataSource: DataSource = crearDataSource()
    private var hizoCargaDatosInicial = false
    
    // MARK: - Métodos públicos
    init(view: ResumenMovimientosView, contenedor: NSPersistentContainer) {
        self.resumenView = view
        self.contenedorDB = contenedor
        super.init(nibName: nil, bundle: nil)
        title = "Resumen"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resumenView)
        
        resumenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resumenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resumenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            resumenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resumenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        resumenView.configurar(montoTotal: 1_209_486.23)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !hizoCargaDatosInicial {
            Movimiento.cargarDesdeDB(usando: contenedorDB.viewContext) { (movimientos) in
                self.models.append(ResumenMovimientosModel(movimientos: movimientos))
                self.aplicarSnapshot()
            }
        }
    }
    
    // MARK: - Métodos privados
    private func crearDataSource() -> DataSource {
        let dataSource = DataSource(tableView: resumenView.tablaMovimientos) { (tableView, indexPath, movimiento) -> UITableViewCell? in
            let cell = UITableViewCell()
            
            return cell
        }
        return dataSource
    }
    
    private func aplicarSnapshot() {
        if let model = models.last {
            var snapshot = Snapshot()
            for seccion in model.secciones {
                snapshot.appendItems(model.movimientosPorSeccion[seccion]!, toSection: seccion)
            }
            dataSource.apply(snapshot)
        } else {
            print("No se encontró modelo.")
        }
    }
}
