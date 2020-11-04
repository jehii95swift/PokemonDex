//
//  Services.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation
import Alamofire
import ObjectMapper
//CLOSURE
class Services {
    
    var pokeIndexes: [PokemonIndex] = []
    
    func requesPokemones(closure: @escaping ([PokemonIndex]) -> ()  ) {
        AF.request("https://pokeapi.co/api/v2/pokemon").responseJSON { response in

            if let json = try! response.result.get() as? [String: Any] {
                var results = json["results"] as? [[String:String]]
                
                 let pokeIndexes = ObjectMapper.Mapper<PokemonIndex>().mapArray(JSONArray: results!)
                  print(pokeIndexes)
                self.pokeIndexes = pokeIndexes
                closure(pokeIndexes)
                
            }
           
        }
    }
    
    func getInfo(name: String, closure:@escaping (Pokemon) -> () ) {
        AF.request("https://pokeapi.co/api/v2/pokemon/\(name)").responseJSON { response in
            
            if let json = try! response.result.get() as? [String: Any] {
                
                let pokemon = ObjectMapper.Mapper<Pokemon>().map(JSON: json)
                closure(pokemon!)
                
            }
        }

    }
    
}

