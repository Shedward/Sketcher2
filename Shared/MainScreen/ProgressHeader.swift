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

    var body: some View {
        HStack(spacing: Design.Space.level2) {
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
                .padding(.trailing, Design.Space.level3)
        }
        .padding(.all, Design.Space.level2)
        .background(Design.Color.group)
        .cornerRadius(Design.Space.level2)
    }
}

struct ProgressHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressHeader(
                title: "Начни рисовать регулярно",
                subtitle: "Настрой прогресс и напоминания"
            )
                .padding(.all, 10)
                .previewLayout(.sizeThatFits)

            ProgressHeader(
                title: "Начни рисовать регулярно",
                subtitle: "Настрой прогресс и напоминания"
            )
                .preferredColorScheme(.dark)
                .padding(.all, 10)
                .previewLayout(.sizeThatFits)
        }
    }
}
