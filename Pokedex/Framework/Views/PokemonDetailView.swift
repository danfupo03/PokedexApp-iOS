//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Dan FuPo on 01/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
  let pokemon: PokemonBase
  
  func formatPokemonID(_ id: Int) -> String {
    let numberOfDigits = String(id).count
    let leadingZerosCount = max(0, 4 - numberOfDigits)
    
    return "#\(String(repeating: "0", count: leadingZerosCount))\(id)"
  }
  
  var body: some View {
    VStack {
      HStack{
        Text(pokemon.pokemon.name.capitalized)
          .font(.title)
        
        Text(formatPokemonID(pokemon.id))
          .font(.title2)
          .foregroundStyle(.gray)
      }
      WebImage(url: URL(string: pokemon.perfil?.sprites.front_default ?? ""))
        .resizable()
        .scaledToFill()
        .background(.blue)
        .frame(width: 100, height: 10, alignment: .center)
      Spacer()
      HStack {
        Text("Hello, World!")
          .background(
            RoundedRectangle(cornerRadius: 4)
              .fill(Color.gray)
              .frame(width: 300, height: 100)
          )
      }
      
      Spacer()
      
      // Display other information about the Pokémon here
    }
    .padding()
    .navigationTitle("Details")
    //.frame(maxWidth: .infinity, alignment: .leading)
  }
}




struct Previews_PokemonDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let samplePokemon = PokemonBase(id: 1000, pokemon: Pokemon(name: "Pikachu", url: "sample_url"), perfil: nil) // Replace with your sample data
    
    return PokemonDetailView(pokemon: samplePokemon)
  }
}

