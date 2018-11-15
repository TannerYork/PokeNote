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
    var pokeTypes: [String: UIColor] = [:]

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
    
    //Gets a pokemon from the JSON data and sets up the assosiated objects and values
    func getPokemon(_ json: JSON) {
        
        let pokemon = Pokemon(json)
        
        pokeImageURL = self.imageURL + pokemon.id + ".png"
        name.text = pokemon.name
        frontImage.sd_setImage(with: URL(string: pokemon.sprites["front_default"]!), placeholderImage: UIImage(named: "placeholder.png"))
         backImage.sd_setImage(with: URL(string: pokemon.sprites["back_default"]!), placeholderImage: UIImage(named: "placeholder2.png"))
        
        pokeTypes.removeAll()
        for type in pokemon.types {
            pokeTypes[type] = Types.getColor(type)
        }
        
        let details = ""
        self.details.text = details
        
        
    }
    
}


//Swith class for getting the type and chaning name lable for details view to the azzosiated color
//Currently due to the error for retrieving the types this does not work...
    //    switch pokeTypes {
    //    case ["bug": .bug]:
    //        name.backgroundColor = .bug
    //    case ["dark": .dark]:
    //        name.backgroundColor = .dark
    //    case ["dragon": .dragon]:
    //        name.backgroundColor = .dragon
    //    case ["electric": .electric]:
    //        name.backgroundColor = .electric
    //    case ["fairy": .fairy]:
    //        name.backgroundColor = .fairy
    //    case ["fighting": .fighting]:
    //        name.backgroundColor = .fighting
    //    case ["fire": .fire]:
    //        name.backgroundColor = .fire
    //    case ["flying": .flying]:
    //        name.backgroundColor = .flying
    //    case ["ghost": .ghost]:
    //        name.backgroundColor = .ghost
    //    case ["grass": .grass]:
    //        name.backgroundColor = .grass
    //    case ["ground": .ground]:
    //        name.backgroundColor = .ground
    //    case ["ice": .ice]:
    //        name.backgroundColor = .ice
    //    case ["normal": .normal]:
    //        name.backgroundColor = .normal
    //    case ["poison": .poison]:
    //        name.backgroundColor = .poison
    //    case ["rock": .rock]:
    //        name.backgroundColor = .rock
    //    case ["steel": .steel]:
    //        name.backgroundColor = .steel
    //    case ["water": .water]:
    //        name.backgroundColor = .water
    //    default:
    //        return
    //    }
    //


