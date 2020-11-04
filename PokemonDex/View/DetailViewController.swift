//
//  DetailViewController.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class DetailViewController: UIViewController {

    var controller = Controller()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func configureViewDetail(pokeindex:PokemonIndex) {
        print(pokeindex.name)
        controller.getInfo(name: pokeindex.name) { pokemon in
            let imagen = pokemon.sprites ["front_default"] as? String
            let stats = pokemon.stats
            print("hola \(imagen)")
        }
    }
    

}
    
