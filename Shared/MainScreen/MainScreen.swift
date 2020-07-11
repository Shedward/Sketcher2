//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack(spacing: Design.Space.level0) {
            ProgressHeader(
                title: "Начни рисовать регулярно",
                subtitle: "Настрой прогресс и напоминания"
            )
            MainScreenSection(
                title: "Рекомендуем",
                accessory: {
                    EmptyView()
                },
                content: {
                    Rectangle()
                        .foregroundColor(.blue)
                }
            )
            Spacer()
        }
            .padding(Design.Space.level0)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen()
                .previewLayout(.device)

            MainScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.device)
        }
    }
}
