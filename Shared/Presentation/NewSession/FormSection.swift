//
//  FormSection.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct FormSection<Content: View>: View {
	let title: String?
	let spacingLevel = Design.SpacingLevel.level3
	let content: () -> Content

	init(
		title: String? = nil,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.title = title
		self.content = content
	}

    var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.value) {
			if let title = title {
				Text(title)
					.font(Design.Font.body2)
			}
			content()
		}
    }
}

struct FormSection_Previews: PreviewProvider {
    static var previews: some View {
		FormSection(title: "Секция") {
			FormFieldsGroup {
				Text("Item1")
					.font(Design.Font.body1)
				Text("Item2")
					.font(Design.Font.body1)
				Text("Item3")
					.font(Design.Font.body1)
			}
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}
