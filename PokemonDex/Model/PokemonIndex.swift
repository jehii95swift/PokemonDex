//
//  PokemonIndex.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation
import ObjectMapper

class PokemonIndex: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        url    <- map["url"]
    }
    
    var name: String = ""
    var url: String = ""
    
}
