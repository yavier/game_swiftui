//
//  HomeViewModel.swift
//  GameUI
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {

  @Published var players: [Player] = []

  func fetchPlayers() {


    // sample data...

    let data = [

      Player(id: 1, powers: [0.2,0.5,0.9], image: "Player1", name: "Bomb Raider", color: Color("Color2")),
      Player(id: 2, powers: [0.3,0.5,0.6], image: "Player2", name: "Pekka", color: Color("Color3")),
      Player(id: 3, powers: [0.5,0.4,0.8], image: "Player3", name: "Barberian",color: Color("Color4")),

    ]


    self.players = data

  }

}
