//
//  ContentView.swift
//  GameUI
//
//  Created by Kavsoft on 28/05/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
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




