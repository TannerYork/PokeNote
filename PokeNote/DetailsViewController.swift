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

class DetailsViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var details: UITextView!
    let pokeAPI = "https://pokeapi.co/docs/v2/"
    var pokeName: String? = ""
    var pokeImage: UIImage? = UIImage()
    var pokeDetails: String? = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
