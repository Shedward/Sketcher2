//
//  ActionButton.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 22.07.2020.
//

import SwiftUI

struct ActionButton: View {

	struct Style {
		let backgroundColor: Color
		let textColor: Color
		let shadowColor: Color

		static let normal = Style(
			backgroundColor: Design.Color.accent,
			textColor: Design.Color.overContent,
			shadowColor: Design.Color.shadow
		)

		static let normalSecondary = Style(
			backgroundColor: .clear,
			textColor: Design.Color.content,
			shadowColor: .clear
		)

		static let overlay = Style(
			backgroundColor: Design.Color.overAccent,
			textColor: Design.Color.content,
			shadowColor: .clear
		)

		static let overlaySecondary = Style(
			backgroundColor: .clear,
			textColor: Design.Color.overContent,
			shadowColor: .clear
		)
	}

	static let size: CGSize = CGSize(width: 255, height: 46)

	let title: String
	let style: Style

    var body: some View {
		Text(title)
			.font(Design.Font.body1)
			.foregroundColor(style.textColor)
			.padding(Design.SpacingLevel.level2.value)
			.frame(width: Self.size.width, height: Self.size.height, alignment: .center)
			.background(style.backgroundColor)
			.cornerRadius(Design.SpacingLevel.level2.value)
			.shadow(color: style.shadowColor, radius: 1, y: 1)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			VStack {
				ActionButton(title: "Normal", style: .normal)
				ActionButton(title: "Normal Secondary", style: .normalSecondary)
			}
			.padding()
			.background(Design.Color.background)
			VStack {
				ActionButton(title: "Overlay", style: .overlay)
				ActionButton(title: "OverlaySecondary", style: .overlaySecondary)
			}
			.padding()
			.background(Design.Color.overBackground)
		}
    }
}
