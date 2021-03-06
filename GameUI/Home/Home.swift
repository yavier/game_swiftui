//
//  Home.swift
//  GameUI
//

import SwiftUI

struct Home : View {

  @ObservedObject var viewModel: HomeViewModel
  

  var body: some View {

    VStack{

      HStack{

        Text("Your Player")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.white)

        Spacer()

        Button(action: {

        }) {

          Image(systemName: "line.horizontal.3.decrease")
            .font(.title)
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal)
      .padding(.top)

      ScrollView(.vertical, showsIndicators: false) {

        VStack(spacing: 10){

          ForEach(viewModel.players, content: Card.init)
        }
        .padding(.bottom)
      }
    }
    .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    .edgesIgnoringSafeArea(.bottom)
    .onAppear(perform: viewModel.fetchPlayers)
  }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
      Home(viewModel: HomeViewModel())
        .previewDevice("iPhone 11")
    }
}
