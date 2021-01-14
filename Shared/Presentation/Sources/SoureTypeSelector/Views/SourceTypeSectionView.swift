//
//  SourceTypeSectionView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 07.12.2020.
//

import SwiftUI

struct SourceTypeSection: Identifiable {
	let id = UUID()
	let title: String
	let sourceTypes: [SourceType]
}

struct SourceTypeSectionView: View {
	let section: SourceTypeSection
	let spacingLevel: Design.SpacingLevel

	var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.value) {
			Text(section.title)
				.font(Design.Font.h2)
				.foregroundColor(Design.Color.content)
			LazyVGrid(
				columns: [
					GridItem(
						.adaptive(minimum: 96),
						spacing: spacingLevel.next.value
					)
				],
				spacing: spacingLevel.next.value
			) {
				ForEach(section.sourceTypes, id: \.self) { sourceType in
					SourceTypeCell(spacing: spacingLevel.next, sourceType: sourceType)
				}
			}
		}
		.padding(spacingLevel.value)
	}
}

struct SourceTypeSectionView_Previews: PreviewProvider {
	static var previews: some View {
		SourceTypeSectionView(
			section: .init(
				title: "Generating",
				sourceTypes: [
					.debug
				]
			),
			spacingLevel: .level1
		)
	}
}
