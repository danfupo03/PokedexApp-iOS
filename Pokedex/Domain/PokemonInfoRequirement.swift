//
//  PokemonInfoRequirement.swift
//  Pokedex
//
//  Created by Dan FuPo on 11/09/23.
//

import Foundation

protocol PokemonInfoRequirementProtocol {
  func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
  static let shared = PokemonInfoRequirement()
  
  let dataRepository: PokemonRepository
  
  init(dataRepository: PokemonRepository = PokemonRepository.shared) {
    self.dataRepository = dataRepository
  }
  
  func getPokemonInfo(numberPokemon:Int) async -> Perfil? {
    return await dataRepository.getPokemonInfo(numberPokemon: numberPokemon)
  }
}
