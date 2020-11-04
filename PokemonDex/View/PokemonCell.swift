//
//  PokemonCell.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var namePokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configName(name:String) {
        namePokemon.text = name
    }
}
