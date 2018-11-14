//
//  PokemonAPI.swift
//  PokeNote
//
//  Created by Tanner York on 11/13/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import SwiftyJSON


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
    init(_ dictionary: JSON) {
        id = dictionary["id"].stringValue
        name = dictionary["name"].stringValue
        baseXP = dictionary["base_experience"].int!
        height = dictionary["height"].int!
        weight = dictionary["weight"].int!
        
        for ability in dictionary["abilities"] {
            abilities.append(dictionary["abilities"]["ability"]["name"].stringValue)
        }
        
        for move in dictionary["moves"] {
            moves.append(dictionary["moves"]["move"]["name"].stringValue)
        }
        
        for (key, value) in dictionary["sprites"] {
            sprites[key] = value.stringValue
        }
        
        for type in dictionary["types"] {
            types.append(dictionary["types"]["type"]["name"].stringValue)
        }
   
    
}

}


