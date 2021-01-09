//
//  TagsEditorView.swift
//  iOS
//
//  Created by Vlad Maltsev on 22.07.2020.
//

import SwiftUI

struct TagsEditorView: View {

	struct SizePreferenceKey: PreferenceKey {
		static var defaultValue: CGSize = .zero

		static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
			value = nextValue()
		}
	}

	struct TagView: View {
		private static let padding = Design.SpacingLevel.level3.value

		let tag: String

		var body: some View {
			Text(Localised.string("#%@", arguments: tag))
				.font(Design.Font.body1)
				.padding(Self.padding)
				.background(Design.Color.group)
				.cornerRadius(Design.SpacingLevel.level2.value)
		}

		static func size(for tag: String) -> CGSize {
			let textSize = NSAttributedString(
				string: Localised.string("#%@", arguments: tag),
				attributes: [
					.font: Design.UIFont.body1
				]
			).size()

			return CGSize(
				width: textSize.width + 2 * padding,
				height: textSize.height + 2 * padding
			)
		}
	}

	private static let insets = Design.SpacingLevel.level4.value

	@State var tags: [String]

    var body: some View {
		FixedSizeGeometryReader { geometry in
			let (layoutedTags, finalSize) = layout(
				tags: tags,
				in: geometry.frame(in: .local).size
			)

			VStack(alignment: .leading, spacing: Self.insets) {
				ForEach(layoutedTags, id: \.self) { row in
					HStack(spacing: Self.insets) {
						ForEach(row, id: \.self) { tag in
							TagView(tag: tag)
						}
					}
				}
			}
			.preference(
				key: ContentSizePreferenceKey.self,
				value: .init(height: finalSize.height)
			)
		}
    }

	private func layout(tags: [String], in size: CGSize) -> ([[String]], CGSize) {
		var items: [[String]] = []
		var finalSize = CGSize(width: size.width, height: 0)

		var currentRow: [String] = []
		var leftSpace: CGFloat = 0

		for tag in tags {
			let tagSize = TagView.size(for: tag)

			if leftSpace > tagSize.width {
				currentRow.append(tag)
				leftSpace -= tagSize.width
			} else {
				if !currentRow.isEmpty {
					items.append(currentRow)
				}
				currentRow = [tag]
				finalSize.height += tagSize.height
				leftSpace = size.width - tagSize.width
			}
		}

		if !currentRow.isEmpty {
			items.append(currentRow)
		}

		finalSize.height += Self.insets * CGFloat(items.count - 1)

		return (items, finalSize)
	}
}

struct TagsEditorView_Previews: PreviewProvider {
    static var previews: some View {
		TagsEditorView(
			tags: [
				"человек",
				"цвет_и_свет",
				"руки",
				"дизайн",
				"кисти",
				"композиция",
				"длинный_многострочный_тег_для_тестирования_переносов",
				"悼測済諏計飯利安凶断理資",
				"वर्णन संस्थान निर्माता प्रव्रुति भाति चुनने"
			]
		)
		.previewLayout(.sizeThatFits)
		.padding(Design.SpacingLevel.level0.value)
    }
}
