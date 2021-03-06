//
//  DetailViewModel.swift
//  GameUI
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {

  @Published var isStored: Bool = false

  func addToFavorites(_ player: Player) {
    self.isStored = true
  }

}
