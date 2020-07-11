//
//  BottomToolbar.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 12.07.2020.
//

import SwiftUI

struct BottomToolbar<Content: View>: View {
    private let content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            content()
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.blue)
                .opacity(0.5)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolbar {
            VStack {
                List(1..<25) { index in
                    Text("\(index) item")
                }
                Rectangle().frame(height: 100)
            }
        }
    }
}
