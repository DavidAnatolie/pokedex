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
    private var _nextEvolutionName: String!
    private var _nextEvolutionID: String!
    private var _nextEvolutionLvl: String!
    private var _abilities: String!
    private var _happiness: String!
    private var _speed: String!
    
    // Moves TO-DO
    
    init(name: String, ID: Int) {
        self._name = name
        self._pokedexId = ID
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(ID)/"
    }
    
    // Getters
    
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
    
    var nextEvolutionName: String {
        get {
            if _nextEvolutionName == nil {
                _nextEvolutionName = ""
            }
            return _nextEvolutionName
        }
    }
    
    var nextEvolutionID: String {
        get {
            if _nextEvolutionID == nil {
                _nextEvolutionID = ""
            }
            return _nextEvolutionID
        }
    }
    
    var nextEvolutionLvl: String {
        get {
            if _nextEvolutionLvl == nil {
                _nextEvolutionLvl = ""
            }
            return _nextEvolutionLvl
        }
    }
    
    var happiness: String {
        get {
            if _happiness == nil {
                _happiness = ""
            }
            return _happiness
        }
    }
    
    var abilities: String {
        get {
            if _abilities == nil {
                _abilities = ""
            }
            return _abilities
        }
    }
    
    var speed: String {
        get {
            if _speed == nil {
                _speed = ""
            }
            return _speed
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
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] {
                    
                    if let resource_uri = descArr[0]["resource_uri"] {
                        
                        let descURL = "\(BASE_URL)\(resource_uri)"
                        
                        Alamofire.request(descURL).responseJSON { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String, Any> {
                                
                                if let description = descDict["description"] as? String {
                                    let fixedDesc = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._description = fixedDesc
                                }
                            }
                            
                            completed()
                        }
                    }
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, Any>], evolutions.count > 0 {
                    
                    if let level = evolutions[0]["level"] as? Int, let url = evolutions[0]["resource_uri"] as? String, let to = evolutions[0]["to"] as? String {
                        
                        self._nextEvolutionLvl = "\(level)"
                        
                        let evoID = url.replacingOccurrences(of: POKEMON_URL, with: "").replacingOccurrences(of: "/", with: "")
                        self._nextEvolutionID = evoID
                        
                        if to.range(of: "mega") == nil {
                            self._nextEvolutionName = to
                        }
                    }
                }
                
                if let abilities = dict["abilities"] as? [Dictionary<String, String>] {
                    
                    if let name = abilities[0]["name"] {
                        self._abilities = name.capitalized
                    }
                    
                    if abilities.count > 1 {
                        
                        for i in 1..<abilities.count {
                            
                            if let name = abilities[i]["name"] {
                                self._abilities! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                
                if let happy = dict["happiness"] as? Int {
                    self._happiness = "\(happy)"
                }
                
                if let speed = dict["speed"] as? Int {
                    self._speed = "\(speed)"
                }
            }
            completed()
        }
    }
}
