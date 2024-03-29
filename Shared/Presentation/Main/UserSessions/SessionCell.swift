//
//  SessionCell.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct SessionCell: View {

	static let minimumWidth: CGFloat = 150

    let image: UIImage?
    let title: String
    let subtitle: String?
    let spacingLevel: Design.SpacingLevel

    var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.next.value) {
			Image(uiImage: image ?? UIImage())
				.resizable()
				.aspectRatio(contentMode: .fill)
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
		.contentShape(Rectangle())
    }
}

struct SessionCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SessionCell(
                image: UIImage(named: "session1"),
                title: "Лица",
                subtitle: "Выбор редакции",
                spacingLevel: .level2
            )
            .previewLayout(.sizeThatFits)
            .padding(Design.SpacingLevel.level1.value)

            SessionCell(
                image: UIImage(named: "session1"),
                title: "Лица",
                subtitle: "Выбор редакции",
                spacingLevel: .level2
            )
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding(Design.SpacingLevel.level1.value)
        }
    }
}
