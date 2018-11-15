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
        print(API["abilities"])
        
        //The below code currently gets the number of objects in the array but not the name value needed
        for ability in API["abilities"] {
            abilities.append(API["abilities"]["ability"]["name"].stringValue)
        }
        for move in API["moves"] {
            moves.append(API["moves"]["move"]["name"].stringValue)
        }
        
        for (key, value) in API["sprites"] {
            sprites[key] = value.stringValue
        }
        
        for type in API["types"] {
            types.append(API["types"]["type"]["name"].stringValue)
        }
    
}

}


struct Type {
    let name: String
    let url: String
    
    init(_ json: JSON) {
        name = json["name"].stringValue
        url = json["url"].stringValue
    }
    
}


