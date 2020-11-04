//
//  StatCell.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class StatCell: UICollectionViewCell {
    
    
    @IBOutlet weak var statNameLbl: UILabel!
    @IBOutlet weak var powerStatLbl: UILabel!
    @IBOutlet weak var powerContraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureStat(stat: PokeStats) {
        powerStatLbl.text = "\(stat.baseStat)"
        let statName = stat.stat["name"]
        statNameLbl.text = statName
        powerContraint.constant = CGFloat(stat.baseStat) * 1.8
        print(stat.baseStat)
    }

}
