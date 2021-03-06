//
//  Player.swift
//  GameUI
//
//  Created by Francisco Javier Garcia Galvan on 06/03/21.
//  Copyright © 2021 Balaji. All rights reserved.
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
