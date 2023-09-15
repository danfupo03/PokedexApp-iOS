//
//  PerfilViewModel.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import Foundation

class PerfilViewModel: ObservableObject {
  @Published var email = ""
  
  var userRequirement: UserRequirementProtocol
  
  init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
    self.userRequirement = userRequirement
  }
  
  @MainActor
  func getCurrentUser() {
    self.email = self.userRequirement.getCurrentUser() ?? ""
  }
  
  @MainActor
  func logOut() {
    self.email = ""
    self.userRequirement.removeCurrentUser()
  }
}
