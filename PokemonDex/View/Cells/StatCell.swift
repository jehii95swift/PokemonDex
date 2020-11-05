//
//  StatCell.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import UIKit

class StatCell: UICollectionViewCell {
    
    @IBOutlet private weak var statNameLbl: UILabel!
    @IBOutlet private weak var powerStatLbl: UILabel!
    @IBOutlet private weak var powerContraint: NSLayoutConstraint!
    
    func configureStat(stat: PokeStats) {
        powerStatLbl.text = "\(stat.baseStat)"
        let statName = stat.stat["name"]
        statNameLbl.text = statName
        powerContraint.constant = CGFloat(stat.baseStat) * 1.8
    }
}
