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
        HStack(spacing: 8) {
            Image("progress2")
                .foregroundColor(Color.Design.content)

            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color.Design.content)
                    .fixedSize()
                    .font(Font.Design.h2)
                Text(subtitle)
                    .foregroundColor(Color.Design.accessory)
                    .fixedSize()
                    .font(Font.Design.body3)
            }
            Spacer()
            Image("bigChevron")
                .foregroundColor(Color.Design.accessory)
                .padding(.trailing, 6)
        }
        .padding(.all, 12)
        .background(Color.Design.group)
        .cornerRadius(12)
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
