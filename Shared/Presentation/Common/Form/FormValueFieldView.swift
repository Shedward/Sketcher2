//
//  FormField.swift
//  iOS
//
//  Created by Vlad Maltsev on 21.07.2020.
//

import SwiftUI

struct FormValueFieldView: View {
	let title: String
	let value: String?
	let expanding: Bool

	init(title: String, value: String? = nil, expanding: Bool = true) {
		self.title = title
		self.value = value
		self.expanding = expanding
	}

    var body: some View {
		HStack(spacing: 0) {
			Text(title).font(Design.Font.body1)
			Spacer()
			if let value = value {
				Text(value).font(Design.Font.body2)
			}
			if expanding {
				FixedSpacer(width: Design.SpacingLevel.level1.value)
				Image("chevron")
			}
		}
		.contentShape(Rectangle())
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
		FormFieldContainer(position: .topAndBottom) {
			FormValueFieldView(title: "Время на картинку", value: "1 мин")
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}
