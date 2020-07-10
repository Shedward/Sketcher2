//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        HStack {
            Image("progress1")
                .padding(.bottom, 3)
            Text("Hello, world!")
                .font(Font.Design.h1)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
