//
//  MenuView.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import SwiftUI

struct MenuView: View {
  
  /// Used by the coordinator to manage the flow
  let goRoot: () -> Void
  
  var body: some View {
    
    TabView {
      ContentView()
        .tabItem {
          Image(systemName: "cricket.ball")
          Text("Pokedex")
        }
      
      PerfilView(goRoot:goRoot)
        .tabItem {
          Image(systemName: "person")
          Text("Perfil")
        }
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView(goRoot: {})
  }
}
