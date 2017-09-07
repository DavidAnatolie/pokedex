//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by David Islam on 2017-08-30.
//  Copyright © 2017 David Islam. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var baseImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var abilitiesLbl: UILabel!
    @IBOutlet weak var happinessLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var banner: UIView!
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet var imageCollection: [UIImageView]!
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        pokemon.downloadPokemonDetails {
            // Whatever we write will only be executed once the download is complete!!!
            self.updateUI()
            self.tableView.reloadData()
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
        descriptionLbl.text = pokemon.description
        happinessLbl.text = pokemon.happiness
        speedLbl.text = pokemon.speed
        abilitiesLbl.text = pokemon.abilities
        
        // evoLabel
        if pokemon.nextEvolutionName == "" {
            // This pokemon does not evolve
            nextEvoImg.isHidden = true
            evoLbl.text = "No Evolutions"
        } else {
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
            evoLbl.text = pokemon.nextEvolutionLvl != "" ? "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLvl)" : "Next Evolution: \(pokemon.nextEvolutionName) - LVL ???"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.moves.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokeMovesCell", for: indexPath) as? PokeMovesCell {
            
            let move = pokemon.moves[indexPath.row]
            cell.configureCell(move: move)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.alpha = 0.80
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggle(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            isViewHidden(p: false)
            tableView.isHidden = true
        } else {
            isViewHidden(p: true)
            tableView.isHidden = false
        }
    }
    
    func isViewHidden(p: Bool) {
        for label in labelCollection {
            label.isHidden = p
        }
        
        for img in imageCollection {
            img.isHidden = p
        }
        
        banner.isHidden = p
    }
}
