//
//  Detail.swift
//  GameUI
//
//  Created by Francisco Javier Garcia Galvan on 06/03/21.
//  Copyright © 2021 Balaji. All rights reserved.
//

import SwiftUI

// Detail View...

struct Detail : View {

  let player: Player

  @Environment(\.presentationMode) var presentationMode

  private func header() -> some View {
    HStack(spacing: 8){

      Button(action: onTapBack) {
        Image(systemName: "chevron.left")
        //          .font(.title)
        //          .foregroundColor(.white)
      }

      Text("Overview")
        //        .font(.title)
        .fontWeight(.bold)
        //        .foregroundColor(.white)
        .frame(maxWidth: .infinity)

      Button(action: onTapGrid) {
        Image(systemName: "circle.grid.2x2.fill")
        //          .font(.title)
        //          .foregroundColor(.white)
      }
    }
    .foregroundColor(.white)
    .font(.title)
  }

  func footer() -> some View {
    HStack(spacing: 8) {

      Button(action: {

      }) {
        Text("Add Favourite")
          .padding(.vertical)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Capsule().stroke(Color.white, lineWidth: 2))
      }

      Button(action: {
      }) {
        Text("Play Now")
          .padding(.vertical)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Capsule().fill(Color("Color4")))
      }
    }
    .fixedSize(horizontal: false, vertical: true)
    .foregroundColor(.white)
    .padding(.bottom, 8)
  }

  var body: some View{

    VStack{

      header()

      ScrollView {
        Image(player.image)
          .resizable()
          .frame(width: UIScreen.main.bounds.width * 0.60, height: UIScreen.main.bounds.width * 0.60 * 1.04)
          .background(Color.white.opacity(0.2))
          .cornerRadius(30)

        Text(player.name)
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.top)

        Text(player.description)
          .multilineTextAlignment(.center)
          .font(.callout)
          .padding(.top, 8)
      }
      .foregroundColor(.white)

      footer()

    }
    .padding(.horizontal)
    .background(gradient())
    .navigationBarTitle("",displayMode: .inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
  }

  func gradient() -> some View {

    LinearGradient(gradient: Gradient(colors: [Color("Color2"),Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
  }

  func onTapBack() {
    self.presentationMode.wrappedValue.dismiss()
  }

  func onTapGrid() {

  }

}


struct Detail_Previews: PreviewProvider {
  static var previews: some View {
    Detail(player: Player(id: 1, powers: [0.1,0.1,0.1], image: "Player1", name: "Example", color: .carnation))
  }
}
