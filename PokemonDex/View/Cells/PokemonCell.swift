//
//  PokemonCell.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet private weak var imagePokemon: UIImageView!
    @IBOutlet private weak var namePokemon: UILabel!
    
    func configName(name:String) {
        namePokemon.text = name
        imagePokemon.image = UIImage(named: "imagenplaceholder")
    }
}
