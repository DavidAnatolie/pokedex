//
//  Pokemon.swift
//  pokedex
//
//  Created by David Islam on 2017-08-29.
//  Copyright © 2017 David Islam. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String
    private var _pokedexId: Int
    private var _pokemonURL: String
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(pokedexId)/"
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
    }
    
    var type: String {
        get {
            if _type == nil {
                _type = ""
            }
            return _type
        }
    }
    
    
    var defense: String {
        get {
            if _defense == nil {
                _defense = ""
            }
            return _defense
        }
    }
    
    var height: String {
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        }
    }
    
    var weight: String {
        get {
            if _weight == nil {
                _weight = ""
            }
            return _weight
        }
    }
    
    var attack: String {
        get {
            if _attack == nil {
                _attack = ""
            }
            return _attack
        }
    }
    
    var nextEvoText: String {
        get {
            if _nextEvoTxt == nil {
                _nextEvoTxt = ""
            }
            
            return _nextEvoTxt
        }
    }
    
    // "lazy loading"
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        Alamofire.request(self._pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, Any> {
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        
                        for i in 1..<types.count {
                            
                            if let name = types[i]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
}
