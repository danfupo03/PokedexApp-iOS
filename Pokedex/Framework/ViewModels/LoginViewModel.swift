//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var messageAlert = ""
  @Published var showAlert = false
  
  var userRequirement: UserRequirementProtocol
  
  init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
    self.userRequirement = userRequirement
  }
  
  @MainActor
  func getCurrentUser() {
    self.email = self.userRequirement.getCurrentUser() ?? ""
  }
  
  @MainActor
  func setCurrentUser() {
    if email.isEmpty {
      self.messageAlert = "Correo inválido"
      self.showAlert = true
    } else {
      self.userRequirement.setCurrentUser(self.email)
    }
  }
}
