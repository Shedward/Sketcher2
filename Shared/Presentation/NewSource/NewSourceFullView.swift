//
//  NewSourceFullView.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import SwiftUI

struct NewSourceFullView: View {
	let spacingLevel = Design.SpacingLevel.level0

	var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.value) {
			Text("Тип источника")
				.font(Design.Font.h1)
			FormSection(title: "Test") {
			}
		}
	}
}

struct NewSourceFullView_Previews: PreviewProvider {
	static var previews: some View {
		NewSourceFullView()
	}
}
