//
//  ViewController.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet private weak var pokemonCollectionView: UICollectionView!
    @IBOutlet private weak var buscadorTextField: UITextField!

    
    private let controller = Controller()
    private var pokemonIndex: [PokemonIndex] = []
    private var filteredPokemonIndex: [PokemonIndex] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        configGradient()
        requestPokemons()
        buscadorTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func requestPokemons() {
        
        controller.requestPokemons { pokemonIndex in
            self.pokemonIndex = pokemonIndex
            self.filteredPokemonIndex = pokemonIndex
            self.pokemonCollectionView.reloadData()
        }
    }
    
    private func registerCell () {
        pokemonCollectionView.register(UINib(nibName: "PokemonCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCell")
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
           guard let searchedText = textField.text else {
               return
           }
           
           filteredPokemonIndex = pokemonIndex.filter { $0.name.starts(with: searchedText) }
           pokemonCollectionView.reloadData()
    }
    
    func configGradient() {
            let gradient: CAGradientLayer = CAGradientLayer()
            
            gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
            gradient.locations = [0.0 , 1.0]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.view.layer.insertSublayer(gradient, at: 0)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPokemonIndex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonInicial = filteredPokemonIndex[indexPath.row]
        let cellPokemons = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cellPokemons.configName(name: pokemonInicial.name)
        return cellPokemons
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = filteredPokemonIndex[indexPath.row]
        let vc = DetailViewController()
        vc.loadViewIfNeeded()
        vc.configureViewDetail(pokeindex: pokemon)
        self.present(vc, animated: true, completion: nil)
    }
}
