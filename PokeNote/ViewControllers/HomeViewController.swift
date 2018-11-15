//
//  HomeViewController.swift
//  PokeNote
//
//  Created by Tanner York on 11/14/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {

    @IBOutlet weak var Pokemon: UITableView!
    @IBOutlet weak var seach: UISearchBar!
    let allPokemon = "https://pokeapi.co/api/v2/pokemon/"
    var pokeNames: [String] = []
    var json = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getALLPokemon()
    }
    
    
    //Gets the names for all the pokemon in the pokeAPI and appendeds them to the pokeNames array
    func getALLPokemon() {
        
        //Getting the data from the pokeAPI
        Alamofire.request(allPokemon).responseJSON { (response) in
            switch response.result {
                
            case .success(let value):
                self.json = JSON(value)
                
                //Gettng all the pokemon names form the json api data
                 let results = self.json["results"].arrayValue
                    for result in results {
                        self.pokeNames.append(result["name"].stringValue)
                    }
                self.Pokemon.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    //Sends the data from the selected cell to the details view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let indexPath = self.Pokemon!.indexPathsForSelectedRows!.first!
        let poke = pokeNames[indexPath.row]
        let vc = segue.destination as! DetailsViewController
        vc.pokemon = poke
        
    }

}

//Extension for tableview methods/setup
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        cell.pokeNameLable.text = pokeNames[indexPath.row]
        return cell
    }
    
}