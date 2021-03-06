//
//  Detail.swift
//  GameUI
//
//

import SwiftUI

// Detail View...
struct Detail : View {

  let player: Player

  @State var isLike: Bool = false

  @State var likeAnimation: Bool = false

  var viewModel: DetailViewModel = DetailViewModel()

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


        withAnimation(Animation.spring()) {
          introTextOpacity = 1.0
        }

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

  @State var introTextOpacity: Double = 0.0

  var body: some View{
    ZStack{

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


      Image(systemName: "heart.fill")
        .resizable()
        .scaledToFit()
        .padding()
        .foregroundColor(.red)
        .opacity(introTextOpacity)
        .scaleEffect(1)
        .onAnimationCompleted(for: introTextOpacity) {
          print("Intro text animated in!")
          introTextOpacity = 0
        }

    }
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
