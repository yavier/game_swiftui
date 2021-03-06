//
//  Player.swift
//  GameUI
//

import Foundation
import SwiftUI

struct Player : Identifiable {

  var id : Int
  var powers : [CGFloat]
  var image : String
  var name : String
  var color : Color
  let description: String = "Super smash bros ultimate\ncillagers from the animal crossing series.\nThis troops fight most effictively in large group."
}
