//
//  ContentView.swift
//  GameUI
//

import SwiftUI

struct ContentView: View {
  var body: some View {

    NavigationView{

      Home(viewModel: HomeViewModel())
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}




