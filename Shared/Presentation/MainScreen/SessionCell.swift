//
//  SessionCell.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct SessionCell: View {
    let image: UIImage?
    let title: String
    let subtitle: String?
    let spacingLevel: Design.SpacingLevel

    var body: some View {
        VStack(alignment: .leading, spacing: spacingLevel.next.value) {
            Rectangle()
                .frame(height: 90)
                .foregroundColor(Design.Color.group)
                .cornerRadius(spacingLevel.value)
                .shadow(color: Design.Color.shadow, radius: 1)
            VStack(alignment: .leading, spacing: spacingLevel.next(by: 2).value) {
                Text(title)
                    .font(Design.Font.h3)
                    .foregroundColor(Design.Color.content)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(Design.Font.body3)
                        .foregroundColor(Design.Color.accessory)
                }
            }
        }
        .frame(maxWidth: 260)
    }
}

struct SessionCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SessionCell(
                image: UIImage(named: "session1"),
                title: "Лица",
                subtitle: "Выбор редакции",
                spacingLevel: .level3
            )
            .previewLayout(.sizeThatFits)
            .padding(Design.SpacingLevel.level2.value)
            SessionCell(
                image: UIImage(named: "session1"),
                title: "Лица",
                subtitle: "Выбор редакции",
                spacingLevel: .level3
            )
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding(Design.SpacingLevel.level2.value)
        }
    }
}
