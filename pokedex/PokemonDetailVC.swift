//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by David Islam on 2017-08-30.
//  Copyright © 2017 David Islam. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name.capitalized

    }

}
