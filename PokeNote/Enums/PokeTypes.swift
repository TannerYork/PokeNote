//
//  PokeTypes.swift
//  PokeNote
//
//  Created by Tanner York on 11/13/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit
enum Types {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case rock
    case steel
    case water
    
    static func getColor(_ type: String) -> UIColor {
        switch type {
        case "bug":
            return .bug
        case "dark":
            return .dark
        case "dragon":
            return .dragon
        case "electric":
            return .electric
        case "fairy":
            return .fairy
        case "fighting":
            return .fighting
        case "fire":
            return .fire
        case "flying":
            return .flying
        case "ghost":
            return .ghost
        case "grass":
            return .grass
        case "ground":
            return .ground
        case "ice":
            return . ice
        case "normal":
            return .normal
        case "poison":
            return .poison
        case "rock":
            return .rock
        case "steel":
            return .steel
        case "water":
            return .water
        default:
            return .blue
        }
        
    }
}


