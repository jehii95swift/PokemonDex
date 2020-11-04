//
//  Controller.swift
//  PokemonDex
//
//  Created by mac on 4/11/20.
//

import Foundation

class Controller {
    
    let services = Services()
    
    func requestPokemons(closure: @escaping ([PokemonIndex]) -> () ) {
        services.requesPokemones(closure: closure)
    }
    
    func getPokemons() -> [PokemonIndex] {
        return services.pokeIndexes
    }
    
    func getInfo(name: String, closure:@escaping (Pokemon) -> () ) {
        services.getInfo(name: name, closure: closure)
    }
}
