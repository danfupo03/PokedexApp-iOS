//
//  PerfilView.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import SwiftUI

struct PerfilView: View {
  @StateObject var perfilViewModel = PerfilViewModel()
  
  /// Used by the coordinator to manage the flow
  let goRoot: () -> Void
  
  var body: some View {
    VStack(alignment: .center, spacing: 24) {
      Text(perfilViewModel.email)
      
      Button {
        perfilViewModel.logOut()
        /// Used by the coordinator to manage the flow
        goRoot()
      } label: {
        HStack(spacing: 16) {
          Image(systemName: "power")
          Text("Logout")
        }.foregroundColor(.red)
      }
    }.onAppear {
      perfilViewModel.getCurrentUser()
    }
  }
}

struct PerfilView_Previews: PreviewProvider {
  static var previews: some View {
    PerfilView{()}
  }
}
