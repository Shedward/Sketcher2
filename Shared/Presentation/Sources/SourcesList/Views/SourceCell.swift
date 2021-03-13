//
//  SourceCell.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.10.2020.
//

import SwiftUI

struct SourceCell: View {
	let source: Source
	var icon: UIImage?
	let spacingLevel = Design.SpacingLevel.level2

    var body: some View {
		HStack(spacing: spacingLevel.value) {
			if let icon = icon {
				Image(uiImage: icon)
					.transition(.opacity)
			}
			VStack(alignment: .leading, spacing: 0) {
				Text(source.title)
					.font(Design.Font.body1)
					.lineLimit(2)
				AuthorView(author: source.author)
			}
			Spacer()
			SourceGalleryView(images: source.preview)
		}
    }
}

struct SourceCell_Previews: PreviewProvider {
    static var previews: some View {
		SourceCell(source: Mocks.source)
			.padding(Design.SpacingLevel.level0.value)
    }
}
