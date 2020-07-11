//
//  ProgressHeader.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct ProgressHeader: View {
    let title: String
    let subtitle: String
    let spacingLevel: Design.SpacingLevel

    var body: some View {
        HStack(spacing: spacingLevel.value) {
            Image("progress2")
                .foregroundColor(Design.Color.content)

            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Design.Color.content)
                    .lineLimit(1)
                    .font(Design.Font.h3)
                Text(subtitle)
                    .foregroundColor(Design.Color.accessory)
                    .lineLimit(1)
                    .font(Design.Font.caption)
            }
            Spacer()
            Image("bigChevron")
                .foregroundColor(Design.Color.accessory)
                .padding(.trailing, spacingLevel.next.value)
        }
        .padding(.all, spacingLevel.value)
        .background(Design.Color.group)
        .cornerRadius(spacingLevel.value)
    }
}

struct ProgressHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressHeader(
                title: "Начни рисовать регулярно",
                subtitle: "Настрой прогресс и напоминания",
                spacingLevel: .level3
            )
                .padding(.all, 10)
                .previewLayout(.sizeThatFits)

            ProgressHeader(
                title: "Начни рисовать регулярно",
                subtitle: "Настрой прогресс и напоминания",
                spacingLevel: .level3
            )
                .preferredColorScheme(.dark)
                .padding(.all, 10)
                .previewLayout(.sizeThatFits)
        }
    }
}
