//
//  ViewController.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    let controller = Controller()
    var pokemonIndex: [PokemonIndex] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        pokemonCollectionView.delegate = self
        controller.requestPokemons { pokemonIndex in
            self.pokemonIndex = pokemonIndex
            self.pokemonCollectionView.reloadData()
        }
        
        pokemonCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pokemonCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonIndex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonInicial = pokemonIndex[indexPath.row]
        let cellPokemons = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cellPokemons.configName(name: pokemonInicial.name)
        return cellPokemons
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 60)
    }
    
    func registerCell () {
        pokemonCollectionView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var pokemon = pokemonIndex[indexPath.row]
        let vc = DetailViewController()
        vc.loadViewIfNeeded()
        vc.configureViewDetail(pokeindex: pokemon)
        self.present(vc, animated: true, completion: nil)
    }
}
