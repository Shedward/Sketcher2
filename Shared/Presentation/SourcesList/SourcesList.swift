//
//  SourcesList.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.10.2020.
//

import SwiftUI

struct SourcesList: View {
	@Environment(\.presentationMode)
	var presentationMode: Binding<PresentationMode>

	let spacing = Design.SpacingLevel.level0

	var body: some View {
		VStack(alignment: .leading) {
			HStack(spacing: 18) {
				Image("back").onTapGesture {
					presentationMode.wrappedValue.dismiss()
				}
				Text("Источники")
					.font(Design.Font.h1)
				Spacer()
			}
			Spacer()
		}
		.padding(spacing.value)
		.navigationBarRemoved()
	}
}
