//
//  BadgeView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 29.07.2020.
//

import SwiftUI

struct BadgeView: View {
	let text: String
	let spacingLevel: Design.SpacingLevel = .level3

	var body: some View {
		Text(text)
			.font(Design.Font.body4)
			.foregroundColor(Design.Color.overContent)
			.padding(
				EdgeInsets(
					top: spacingLevel.next.value,
					leading: spacingLevel.value,
					bottom: spacingLevel.next.value,
					trailing: spacingLevel.value
				)
			)
			.background(BlurredMaterial())
			.cornerRadius(spacingLevel.value)
	}
}
