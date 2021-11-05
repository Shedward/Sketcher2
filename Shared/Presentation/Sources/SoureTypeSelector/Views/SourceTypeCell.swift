//
//  SourceTypeCell.swift
//  iOS
//
//  Created by Vlad Maltsev on 12.12.2020.
//

import SwiftUI

struct SourceTypeCell: View {
	let spacing: Design.SpacingLevel
	let sourceType: SourceType

    var body: some View {
		VStack(alignment: .leading, spacing: spacing.next.value) {
			ZStack {
				Rectangle()
					.fill(Design.Color.group)
					.frame(width: 96, height: 56)
					.cornerRadius(spacing.next.value)
					.shadow(color: Design.Color.shadow, radius: 1)
				Image(uiImage: Design.Image.Icon.sourceType(kind: sourceType, size: .big))
			}
			Text(sourceType.title)
				.font(Design.Font.h3)
		}
    }
}

struct SourceTypeCell_Previews: PreviewProvider {
    static var previews: some View {
		SourceTypeCell(spacing: .level2, sourceType: .debug)
    }
}
