//
//  PokemonTableViewCell.swift
//  PokeNote
//
//  Created by Tanner York on 11/14/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    
    //MARK: Properties
    @IBOutlet weak var pokeNameLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
