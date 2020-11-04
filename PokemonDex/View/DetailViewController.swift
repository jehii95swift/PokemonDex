//
//  DetailViewController.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statsCollectionView: UICollectionView!
    
    var controller = Controller()
    var pokestats: [PokeStats] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        statsCollectionView.delegate = self
        statsCollectionView.dataSource = self
    }
    
    func configureViewDetail(pokeindex:PokemonIndex) {
        print(pokeindex.name)
        controller.getInfo(name: pokeindex.name) { [self] pokemon in
            self.nameLbl.text = pokeindex.name
            self.pokestats = pokemon.stats
            statsCollectionView.reloadData()
            if let url = pokemon.sprites["front_default"] as? String {
                configureImage(urlSprite: url)
                
            }
        }
    }
    
    func configureImage(urlSprite: String) {
        guard imageView.image == nil else { return }
        guard let url = URL(string: urlSprite) else { return }
        let data = try? Data(contentsOf: url)
            
        if let data = data {
            let image = UIImage(data: data)
            imageView.image = image
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokestats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let stat = pokestats[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCell", for: indexPath) as!  StatCell
        cell.configureStat(stat: stat)
        return cell
    }
    
    func registerCell () {
        statsCollectionView.register(UINib(nibName: "StatCell", bundle: nil), forCellWithReuseIdentifier: "StatCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 60)
    }


}
