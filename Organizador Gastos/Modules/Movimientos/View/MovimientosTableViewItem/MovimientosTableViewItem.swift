//
//  MovimientosTableViewItem.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez on 11/10/20.
//

import UIKit

class MovimientosTableViewItem: UITableViewCell {
    
    static let identifier = "MovimientosTableViewItem"

    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var montoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
