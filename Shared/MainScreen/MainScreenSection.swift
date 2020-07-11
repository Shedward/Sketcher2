//
//  MainScreenSection.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct MainScreenSection<Content: View, Accessory: View>: View {
    let title: String
    let content: () -> Content
    let accessory: () -> Accessory

    init(
        title: String,
        @ViewBuilder accessory: @escaping () -> Accessory,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
        self.accessory = accessory
    }

    var body: some View {
        VStack(spacing: Design.Space.level1) {
            HStack(spacing: Design.Space.level1) {
                Text(title)
                    .font(Design.Font.h1)
                    .layoutPriority(1)
                Spacer()
                accessory()
            }
            content()
                .layoutPriority(1)
        }
    }
}

struct MainScreenHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            section(title: "Рекомендуем")
            section(title: "Сессии")
            Spacer()
                .layoutPriority(1)
        }
        .padding(24)
    }

    private static func section(title: String) -> some View {
        MainScreenSection(
            title: title,
            accessory: { Rectangle().foregroundColor(.red) },
            content: { Rectangle().foregroundColor(.blue) }
        )
    }
}
