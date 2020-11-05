//
//  EstadoActualVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 24/10/20.
//

import UIKit

class EstadoActualVC: UITableViewController, Storyboarded {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var movimientosTableView: UITableView!
    
    weak var coordinator: MovimientosCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovimientosTableViewItem", bundle: nil), forCellReuseIdentifier: MovimientosTableViewItem.identifier)
    }
    
    @IBAction func añadirButtonAction(_ sender: Any) {
        coordinator?.agregarMovimiento()
    }
}
