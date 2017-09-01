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
    @IBOutlet weak var baseImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemon.downloadPokemonDetails {
            // Whatever we write will only be executed once the download is complete!!!
            
            self.updateUI()
        }

    }
    
    func updateUI() {
        nameLbl.text = pokemon.name.capitalized
        pokedexIDLbl.text = "\(pokemon.pokedexId)"
        let img = UIImage(named: "\(pokemon.pokedexId)")
        baseImg.image = img
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        currentEvoImg.image = img
        typeLbl.text = pokemon.type
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
