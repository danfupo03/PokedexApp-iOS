//
//  LoginView.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import SwiftUI

struct LoginView: View {
  @StateObject var loginViewModel = LoginViewModel()
  
  /// Used by the coordinator to manage the flow
  let goMenu: () -> Void
  
  var body: some View {
    VStack(alignment: .center) {
      Spacer().frame(height: 48)
      
      Text("Pokedex").font(.largeTitle)
      
      Spacer()
      
      VStack(spacing: 0) {
        TextField(text: $loginViewModel.email) {
          Text("Correo Electrónico")
        }.multilineTextAlignment(.center)
          .keyboardType(.emailAddress)
          .padding()
          .font(.title3)
          .textInputAutocapitalization(.never)
        
        Divider()
      }
      
      Spacer()
      
      Button {
        loginViewModel.setCurrentUser()
        goMenu()
      } label: {
        Text("Acceder")
      }
    }.onAppear {
      loginViewModel.getCurrentUser()
      
      if loginViewModel.email != "" {
        goMenu()
      }
    }.padding()
      .alert(isPresented: $loginViewModel.showAlert) {
        Alert(
          title: Text("Oops!"),
          message: Text(loginViewModel.messageAlert)
        )
      }
  }
}


struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView{()}
  }
}
