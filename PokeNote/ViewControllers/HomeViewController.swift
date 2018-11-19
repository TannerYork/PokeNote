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
    @IBOutlet weak var searchBar: UISearchBar!
    let allPokemon = "https://pokeapi.co/api/v2/pokemon/"
    var pokeNames: [String] = []
    var searching: Bool?
    var json = JSON()
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchResults: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getALLPokemon()
        searchBar.delegate = self
        Pokemon.reloadData()

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
        var poke = pokeNames[indexPath.row]
        if searching == true {
             poke = searchResults[indexPath.row]
        } else {
             poke = pokeNames[indexPath.row]
        }
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
        if searching == true {
            return searchResults.count
        }
        return pokeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        let pokemon: String
        if searching == true {
            pokemon = searchResults[indexPath.row]
            cell.pokeNameLable.text = pokemon
        } else {
            pokemon = pokeNames[indexPath.row]
            cell.pokeNameLable.text = pokemon
        }
        return cell
    }
    
}

//Extinsion for the seach bar delegate
extension HomeViewController: UISearchBarDelegate {
    
    //Checks when text is changed and populates the seach reaults based on the prefix on the names that is equal to the number of the texts characters and the characters themseleves 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = pokeNames.filter({$0.prefix(searchText.count) == searchText.lowercased()})
        searching = true
        Pokemon.reloadData()
    }
    
}
