//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreen: View {
    let spacingLevel: Design.SpacingLevel

    var body: some View {
        ScrollView {
            VStack(spacing: spacingLevel.value) {
                ProgressHeader(
                    title: "Начни рисовать регулярно",
                    subtitle: "Настрой прогресс и напоминания",
                    spacingLevel: spacingLevel.next(by: 2)
                )
                MainScreenSection(
                    title: "Рекомендуем",
                    spacing: spacingLevel.next,
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
            .padding(spacingLevel.value)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen(spacingLevel: .level0)
                .previewLayout(.device)

            MainScreen(spacingLevel: .level0)
                .preferredColorScheme(.dark)
                .previewLayout(.device)
        }
    }
}
