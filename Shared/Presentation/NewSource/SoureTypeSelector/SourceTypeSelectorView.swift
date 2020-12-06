//
//  NewSourceTypeSelectorView.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import SwiftUI

struct SourceTypeSelectorView: View {
	let spacingLevel = Design.SpacingLevel.level0
	let sections: [SourceTypeSection]

	var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.value) {
			NavigationBar(title: "Тип источника")
			Spacer()
		}
		.padding(spacingLevel.value)
	}
}

struct SourceTypeSelectorView_Previews: PreviewProvider {
	static var previews: some View {
		SourceTypeSelectorView(sections: [])
	}
}
