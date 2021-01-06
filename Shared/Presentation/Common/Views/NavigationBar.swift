//
//  NavigationBar.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 07.12.2020.
//

import SwiftUI

struct NavigationBar: View {
	let title: String
	let showBackButton: Bool
	let spacingLevel: Design.SpacingLevel = .level1

	init(title: String, showBackButton: Bool = false) {
		self.title = title
		self.showBackButton = showBackButton
	}

	@Environment(\.presentationMode)
	var presentationMode: Binding<PresentationMode>

	var body: some View {
		HStack(alignment: .center, spacing: spacingLevel.value) {
			if showBackButton {
				Image("back")
					.onTapGesture {
						presentationMode.wrappedValue.dismiss()
					}
			}
			Text(title)
				.font(Design.Font.h1)
			Spacer()
		}
	}
}
