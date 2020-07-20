//
//  ProgressHeaderView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import SwiftUI

struct ProgressHeaderView: View {

	struct Element: View {
		let item: ProgressItem
		let spacingLevel: Design.SpacingLevel

		var body: some View {
			VStack(alignment: .center, spacing: 0) {
				icon(for: item)
				Text(day(for: item))
					.font(Design.Font.caption)
			}
		}

		private func icon(for item: ProgressItem) -> Image {
			switch item.level {
			case .none:
				return Image("progress0")
			case .normal:
				return Image("progress1")
			case .hight:
				return Image("progress2")
			}
		}

		private func day(for item: ProgressItem) -> String {
			let dayNumber = Calendar.current.component(.day, from: item.date)
			return "\(dayNumber)"
		}
	}

	let progressItems: [ProgressItem]
	let spacingLevel: Design.SpacingLevel

    var body: some View {
		HStack(spacing: spacingLevel.value) {
			Spacer()
			ForEach(progressItems, id: \.date) { progressItem in
				Element(
					item: progressItem,
					spacingLevel: spacingLevel.next
				)
			}
			Spacer()
		}
		.padding(spacingLevel.value)
		.background(Design.Color.group)
		.cornerRadius(spacingLevel.value)
    }
}

struct ProgressHeader_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			ProgressHeaderView(
				progressItems: Mocks.progressItems,
				spacingLevel: .level2
			)
		}
		.padding(Design.SpacingLevel.level1.value)
    }
}
