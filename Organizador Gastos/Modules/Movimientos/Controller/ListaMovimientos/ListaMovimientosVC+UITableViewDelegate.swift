//
//  ListaMovimientosVC+UITableViewDelegate.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 11/10/20.
//

import UIKit

extension ListaMovimientosVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movimientos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovimientosTableViewItem.identifier, for: indexPath)
        return cell
    }
}
