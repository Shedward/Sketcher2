//
//  NewSourceTypeSelectorView.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import SwiftUI

struct SourceTypeSelectorView: View {
	let spacingLevel = Design.SpacingLevel.level0

	@ObservedObject
	var viewModel: ViewModel

	var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.value) {
			NavigationBar(title: Localised.string("Тип источника"), showBackButton: true)
			ForEach(viewModel.sections) { section in
				SourceTypeSectionView(section: section, spacingLevel: spacingLevel.next)
			}
			Spacer()
		}
		.padding(spacingLevel.value)
	}
}

struct SourceTypeSelectorView_Previews: PreviewProvider {
	static var previews: some View {
		SourceTypeSelectorView(viewModel: .init())
	}
}
