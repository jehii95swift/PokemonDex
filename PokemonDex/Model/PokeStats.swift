//
//  pokeStats.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation
import ObjectMapper

class PokeStats:Mappable {
    
    var baseStat: Int = 0
    var stat: [String:String] = [:]
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        baseStat    <- map["base_stat"]
        stat     <- map["stat"]
    }
}
