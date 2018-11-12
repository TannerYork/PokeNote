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
    let pokeAPI = "https://pokeapi.co/docs/v2/"
    var pokeName = ""
    var pokeImage = ""
    var pokeDetails = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = pokeName
        details.text = pokeDetails
        image.sd_setImage(with: URL(string: pokeImage), placeholderImage: UIImage(named: "\(pokeName).png"))


        // Do any additional setup after loading the view.
    }
    

    
}
