//
//  PokeMovesCell.swift
//  pokedex
//
//  Created by David Islam on 2017-09-05.
//  Copyright © 2017 David Islam. All rights reserved.
//

import UIKit

class PokeMovesCell: UITableViewCell {
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var ppLbl: UILabel!
    @IBOutlet weak var accLbl: UILabel!
    @IBOutlet weak var powLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    func configureCell(move: Dictionary<String, String>) {
        idLbl.text = move["ID"]
        ppLbl.text = move["PP"]
        accLbl.text = move["accuracy"]
        powLbl.text = move["power"]
        nameLbl.text = move["moveName"]
    }
}
