//
//  Card.swift
//  GameUI
//

import SwiftUI

struct Power: Identifiable {
  let id = UUID()
  let image: String
  let color: Color
  let progress: CGFloat
}

struct PowerView: View {

  var power: Power

  @State private var progress: CGFloat = 0.0

  var body: some View {
    ZStack {

      Circle()
        .fill(power.color)
      Circle()
        .stroke(Color.black.opacity(0.1), lineWidth: 5)
      Circle()
        .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(Animation.linear(duration: 1).delay(0.5))
      Image(systemName: power.image)
        .foregroundColor(.white)
        .padding()
    }.clipShape(Circle())
    .onAppear(perform: {
      withAnimation {
        progress = power.progress
      }

    })
  }
}


struct Card : View {

  var player: Player

  private var powers: [Power] {
    let images = ["bolt.fill", "suit.heart.fill", "hammer.fill"]
    return zip(images, player.powers).map { image, value in
      Power(image: image, color: player.color, progress: value)
    }
  }

  var body: some View{

    ZStack{
      HStack{

        Image(player.image)
          .resizable()
          .frame(width: UIScreen.main.bounds.width * 0.55)

        Spacer()
        powersView()
      }
      .frame(height: 290)
      .background(background())
      .padding(.horizontal)

      NavigationLink(destination: Detail(player: player)) { Color.clear }
    }

  }

  func powersView() -> some View {
    VStack(spacing: 16) {
      ForEach(powers, content: PowerView.init)
    }.fixedSize(horizontal: false, vertical: true)
  }


  @ViewBuilder
  func background() -> some View {
    Color.white.opacity(0.2)
      .cornerRadius(25)
      // going to rate view in 3d angle...
      .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
      // going to trim view..
      .padding(.vertical, 35)
      .padding(.trailing, 25)
  }

}


struct Card_Previews: PreviewProvider {
  static var previews: some View {

    let player = Player(id: 1, powers: [0.2,0.5,0.9], image: "Player1", name: "Bomb Raider", color: Color("Color"))

    Card(player: player).background(Color.gray)
  }
}
