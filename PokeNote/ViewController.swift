//
//  ViewController.swift
//  PokeNote
//
//  Created by Tanner York on 11/12/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var pokeNameTextFeild: UITextField!
    let pokeAPI = "https://pokeapi.co/docs/v2/"
    let imageURL = "http://pokeapi.co/media/sprites/pokemon/"
    var pokeName = ""
    var pokeDetails = ""
    var pokeImage = UIImage()

    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK: Actions
    @IBAction func enterButton(_ sender: Any) {
        guard let pokemon = pokeNameTextFeild.text else {
             return
        }
        
        
        pokemon.replacingOccurrences(of: " ", with: "+")
        
        var requestURL =  pokeAPI + pokemon + "/"
        
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.pokeName = json["name"].stringValue
                self.pokeDetails = json["details"].stringValue
                
            default:
                return
    
                
            }
        }
        
    }
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = UIViewController(nibName: "DetailsViewController", bundle: nil) as! DetailsViewController
        guard let pokeName = pokeNameTextFeild.text else {
            return
        }
        vc.pokeName = pokeName
        
    }
    
}

