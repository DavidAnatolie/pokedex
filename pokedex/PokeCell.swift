//
//  PokeCell.swift
//  pokedex
//
//  Created by David Islam on 2017-08-29.
//  Copyright © 2017 David Islam. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    func configureCell(pokemon: Pokemon) {
        
        self.thumbImg.image = UIImage(named: "\(pokemon.pokedexId)")
        self.nameLbl.text = pokemon.name.capitalized
    }
}
