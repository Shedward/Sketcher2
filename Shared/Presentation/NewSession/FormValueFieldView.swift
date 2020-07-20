//
//  FormField.swift
//  iOS
//
//  Created by Vlad Maltsev on 21.07.2020.
//

import SwiftUI

struct FormValueFieldView: View {
	let title: String
	let value: String

    var body: some View {
		HStack(spacing: Design.SpacingLevel.level1.value) {
			Text(title).font(Design.Font.body1)
			Spacer()
			Text(value).font(Design.Font.body2)
			Image("chevron")
		}
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
		FormFieldContainer(position: .topAndBottom) {
			FormValueFieldView(title: "Время", value: "1 мин")
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}
