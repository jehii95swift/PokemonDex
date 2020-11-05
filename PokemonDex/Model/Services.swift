//
//  Services.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation
import Alamofire
import ObjectMapper

class Services {
    
    let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    
    func requesPokemones(closure: @escaping ([PokemonIndex]) -> ()  ) {
        AF.request(baseUrl).responseJSON { response in

            if let json = try! response.result.get() as? [String: Any] {
                let results = json["results"] as? [[String:String]]
                
                 let pokeIndexes = ObjectMapper.Mapper<PokemonIndex>().mapArray(JSONArray: results!)
                 closure(pokeIndexes)
            }
        }
    }
    
    func getInfo(name: String, closure:@escaping (Pokemon) -> () ) {
        AF.request("\(baseUrl)\(name)").responseJSON { response in
            
            if let json = try! response.result.get() as? [String: Any] {
                
                let pokemon = ObjectMapper.Mapper<Pokemon>().map(JSON: json)
                closure(pokemon!)
            }
        }
    }
}

