//
//  ListaMovimientosVC.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 11/10/20.
//

import UIKit

class ListaMovimientosVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movimientos: [Movimiento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MovimientosTableViewItem.identifier, bundle: nil), forCellReuseIdentifier: MovimientosTableViewItem.identifier)
    }
    
    @IBAction func addButtonAction(_ _: Any) {
        
    }
    
}
