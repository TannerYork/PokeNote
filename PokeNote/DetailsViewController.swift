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
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var details: UITextView!
    @IBOutlet weak var pokeNameTextFeild: UITextField!
    let pokeAPI = "https://pokeapi.co/api/v2/pokemon/"
    let imageURL = "http://pokeapi.co/media/sprites/pokemon/"
    var pokeImageURL = ""
    var pokeName = ""
    var pokeImage = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButton(_ sender: Any) {
        guard var pokemon = pokeNameTextFeild.text else {
            return
        }
        
        pokemon = pokemon.replacingOccurrences(of: " ", with: "")
        let requestURL =  pokeAPI + pokemon + "/"
        
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                self.pokeName = json["name"].stringValue
                let pokeID = json["id"].stringValue
                self.pokeImageURL = self.imageURL + pokeID + ".png"
                self.name.text = self.pokeName
                self.image.sd_setImage(with: URL(string: self.pokeImageURL), placeholderImage: UIImage(named: "placeholder.png"))
                
            case .failure(let error):
                print(error)
                
            default:
                return
            }
        }
    }
    

    
}
