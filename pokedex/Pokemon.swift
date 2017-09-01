//
//  Pokemon.swift
//  pokedex
//
//  Created by David Islam on 2017-08-29.
//  Copyright © 2017 David Islam. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String
    private var _pokedexId: Int
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
}
