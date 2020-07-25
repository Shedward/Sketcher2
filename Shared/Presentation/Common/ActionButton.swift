//
//  ActionButton.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 22.07.2020.
//

import SwiftUI

struct ActionButton: View {

	static let size: CGSize = CGSize(width: 255, height: 46)

	let title: String

    var body: some View {
		Text(title)
			.font(Design.Font.body1)
			.foregroundColor(Design.Color.background)
			.padding(Design.SpacingLevel.level2.value)
			.frame(width: Self.size.width, height: Self.size.height, alignment: .center)
			.background(Design.Color.accent)
			.cornerRadius(Design.SpacingLevel.level2.value)
			.shadow(color: Design.Color.shadow, radius: 1, y: 1)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
		ActionButton(title: "Button")
    }
}
