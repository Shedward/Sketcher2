//
//  MainScreenSectionView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct MainScreenSectionView<Content: View, Accessory: View>: View {
    private let title: String
    private let content: () -> Content
    private let accessory: () -> Accessory
    private let spacing: Design.SpacingLevel

    init(
        title: String,
        spacing: Design.SpacingLevel,
        @ViewBuilder accessory: @escaping () -> Accessory,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.spacing = spacing
        self.content = content
        self.accessory = accessory
    }

    var body: some View {
        VStack(spacing: spacing.value) {
            HStack(spacing: spacing.value) {
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
        MainScreenSectionView(
            title: title,
            spacing: .level1,
            accessory: { Rectangle().foregroundColor(.red) },
            content: { Rectangle().foregroundColor(.blue) }
        )
    }
}
