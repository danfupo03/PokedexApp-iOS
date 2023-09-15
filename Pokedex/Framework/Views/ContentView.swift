//
//  ContentView.swift
//  Pokedex
//
//  Created by Dan FuPo on 29/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
  @StateObject var contentViewModel = ContentViewModel()
  @State var searchText = ""
  
  //Searchbar logic
  var filteredPokemonList: [PokemonBase] {
    if searchText.isEmpty {
      return contentViewModel.pokemonList
    } else {
      return contentViewModel.pokemonList.filter { $0.pokemon.name.lowercased().contains(searchText.lowercased()) }
    }
  }
  
  //Whole view
  var body: some View {
    NavigationView {
      List(filteredPokemonList) { pokemonBase in
        NavigationLink(destination: PokemonDetailView(pokemon: pokemonBase)) {
          HStack {
            WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48, alignment: .center)
            
            Text(pokemonBase.pokemon.name.capitalized)
          }
        }
      }
      .onAppear {
        Task {
          await contentViewModel.getPokemonList()
        }
      }
      .listStyle(.automatic)
      .navigationTitle("Find your pokemon")
      .searchable(text: $searchText, prompt: "Search Pokemon")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
