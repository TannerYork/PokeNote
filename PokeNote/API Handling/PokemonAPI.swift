//
//  PokemonAPI.swift
//  PokeNote
//
//  Created by Tanner York on 11/13/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import SwiftyJSON

//Gets the JSON data from the pokeAPI for a pokemon and sets the variables and constants to the according key values 
struct Pokemon {
    let id: String
    let name: String
    let baseXP: Int
    let height: Int
    let weight: Int
    var abilities: [String] = []
    var moves: [String] = []
    var sprites: [String : String] = [:]
    var types: [String] = []
    init(_ API: JSON) {
        id = API["id"].stringValue
        name = API["name"].stringValue
        baseXP = API["base_experience"].int!
        height = API["height"].int!
        weight = API["weight"].int!
        
        //Gets the arrays of the needed JSON objects and appeneds the name to the corresponding string array
        for ability in API["abilities"].arrayValue {
            abilities.append(ability["ability"]["name"].stringValue)
        }
        
        for move in API["moves"].arrayValue {
            moves.append(move["move"]["name"].stringValue)
        }
        
        for (key, value) in API["sprites"] {
            sprites[key] = value.stringValue
        }
        
        for type in API["types"].arrayValue {
            types.append(type["type"]["name"].stringValue)
        }
        print(types)
    }
}


