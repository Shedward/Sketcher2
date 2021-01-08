//
//  ProgressElementView.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

struct ProgressItemView: View {
	let item: ProgressItem
	let spacingLevel: Design.SpacingLevel

	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			icon(for: item)
			Text(day(for: item))
				.font(Design.Font.body3)
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
