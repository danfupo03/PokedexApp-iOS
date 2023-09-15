//
//  UserRequirement.swift
//  Pokedex
//
//  Created by Dan FuPo on 12/09/23.
//

import Foundation

protocol UserRequirementProtocol {
  func getCurrentUser() -> String?
  func setCurrentUser(_ email: String)
  func removeCurrentUser()
}

class UserRequirement: UserRequirementProtocol {
  static let shared = UserRequirement()
  let dataRepository: UserRepository
  
  init(dataRepository: UserRepository = UserRepository.shared) {
    self.dataRepository = dataRepository
  }
  
  func getCurrentUser() -> String? {
    return self.dataRepository.getCurrentUser()
  }
  
  func setCurrentUser(_ email: String) {
    self.dataRepository.setCurrentUser(email)
  }
  
  func removeCurrentUser() {
    self.dataRepository.removeCurrentUser()
  }
}
