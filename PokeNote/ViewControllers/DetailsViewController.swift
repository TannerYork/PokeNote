//
//  DetailsViewController.swift
//  PokeNote
//
//  Created by Tanner York on 11/12/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage

class DetailsViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var details: UITextView!
    @IBOutlet weak var backImage: UIImageView!
    
    let pokeAPI = "https://pokeapi.co/api/v2/pokemon/"
    let imageURL = "http://pokeapi.co/media/sprites/pokemon/"
    var pokeImageURL = ""
    var pokemon = ""
    var pokeTypes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creates the url for the specific pokemon data
        let requestURL =  pokeAPI + pokemon + "/"
        
        //Uses the url to get the json data from the url
            Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
                
                //If Successful setup the pokemon and view
            case .success(let value):
                let json = JSON(value)
                self.getPokemon(json)
                
                //If it fails print the error
            case .failure(let error):
                print(error)
                return
                
            }
        }
    }
    
    @IBAction func backToHomeVC(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    //Gets a pokemon from the JSON data and sets up the assosiated objects and values
    func getPokemon(_ json: JSON) {
        
        let pokemon = Pokemon(json)
        
        pokeImageURL = self.imageURL + pokemon.id + ".png"
        name.text = pokemon.name
        frontImage.sd_setImage(with: URL(string: pokemon.sprites["front_default"]!), placeholderImage: UIImage(named: "placeholder.png"))
         backImage.sd_setImage(with: URL(string: pokemon.sprites["back_default"]!), placeholderImage: UIImage(named: "placeholder2.png"))
        
        pokeTypes.removeAll()
        for type in pokemon.types {
            pokeTypes.append(type)
        }
        getTypeColor(pokeTypes)
        
        //Createa a string for the types to be used in the discription/details of the pokemon.
        var types = ""
        for type in pokemon.types {
            types.append(type)
            types.append("\n")
        }
        
        //Createa a string for the abilities to be used in the discription/details of the pokemon.
        var abilities = ""
        for ability in pokemon.abilities {
            abilities.append(ability)
            abilities.append("\n")
        }
        
        let detials = """
Type/Types:
\(types)
        
Abilities:
\(abilities)
"""
        self.details.text = detials

    }
    
    
    //Swith method for getting the type and chaning name lable for details view to the azzosiated color
    func getTypeColor(_ pokeTypes: [String]) {
        for type in pokeTypes {
            switch type {
            case "bug":
                name.backgroundColor = .bug
            case "dark":
                name.backgroundColor = .dark
            case "dragon":
                name.backgroundColor = .dragon
            case "electric":
                name.backgroundColor = .electric
            case "fairy":
                name.backgroundColor = .fairy
            case "fighting":
                name.backgroundColor = .fighting
            case "fire":
                name.backgroundColor = .fire
            case "flying":
                name.backgroundColor = .flying
            case "ghost":
                 name.backgroundColor = .ghost
            case "grass":
                 name.backgroundColor = .grass
            case "ground":
                 name.backgroundColor = .ground
            case "ice":
                 name.backgroundColor = .ice
            case "normal":
                 name.backgroundColor = .normal
            case "poison":
                 name.backgroundColor = .poison
            case "psychic":
                 name.backgroundColor = .psychic
            case "rock":
                 name.backgroundColor = .rock
            case "steel":
                 name.backgroundColor = .steel
            case "water":
                 name.backgroundColor = .water
            default:
                return
            }
        }
    }
}


