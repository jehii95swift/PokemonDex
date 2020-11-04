//
//  Pokemon.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation
import ObjectMapper

class Pokemon:Mappable {
   
    
    var sprites: [String:Any] = [:]
    var stats: [PokeStats] = []
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        sprites    <- map["sprites"]
        stats    <- map["stats"]

    }
}

