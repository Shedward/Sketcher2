//
//  TagsEditorView.swift
//  iOS
//
//  Created by Vlad Maltsev on 22.07.2020.
//

import SwiftUI

struct TagsEditorView: View {

	struct TagView: View {
		private static let padding = Design.SpacingLevel.level3.value

		let tag: String

		var body: some View {
			Text("#\(tag)")
				.font(Design.Font.body1)
				.padding(Self.padding)
				.background(Design.Color.group)
				.cornerRadius(Design.SpacingLevel.level2.value)
		}

		static func size(for tag: String) -> CGSize {
			let textSize = NSAttributedString(
				string: "#\(tag)",
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
		GeometryReader { geometry in
			let layoutedTags = layout(
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
		}
    }

	private func layout(tags: [String], in size: CGSize) -> [[String]] {
		var items: [[String]] = []

		var currentRow: [String] = []
		var leftSpace: CGFloat = size.width

		for tag in tags {
			let width = TagView.size(for: tag).width

			if leftSpace > width {
				currentRow.append(tag)
				leftSpace -= width
			} else {
				items.append(currentRow)
				currentRow = [tag]
				leftSpace = size.width - width
			}
		}

		if !currentRow.isEmpty {
			items.append(currentRow)
		}

		return items
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
				"длинный_многострочный_тег_для тестирования_переносов",
				"悼測済諏計飯利安凶断理資",
				"वर्णन संस्थान निर्माता प्रव्रुति भाति चुनने"
			]
		)
		.padding(Design.SpacingLevel.level0.value)
    }
}
