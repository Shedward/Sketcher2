//
//  Colors.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

extension Design {
    enum Color {
        static let background = SwiftUI.Color("background")
        static let content = SwiftUI.Color("content")
        static let group = SwiftUI.Color("group")
        static let shadow = SwiftUI.Color("shadow")
        static let accessory = SwiftUI.Color("accessory")
        static let accent = SwiftUI.Color("accent")
        static let secondaryAccent = SwiftUI.Color("secondaryAccent")
        static let overBackground = SwiftUI.Color("overBackground")
        static let overContent = SwiftUI.Color("overContent")
        static let overAccent = SwiftUI.Color("overAccent")
    }
}

struct Colors_Previews: PreviewProvider {
	private struct ColorPreview: View {
		let color: Color
		let name: String

		var body: some View {
			HStack(spacing: 16) {
				ZStack(alignment: .center) {
					Circle()
						.stroke(Color.gray)
						.frame(width: 34, height: 34)
					Circle()
						.fill(color)
						.frame(width: 32, height: 32)
				}
				Text(name)
			}
		}
	}

	static var previews: some View {
		VStack(alignment: .leading) {
			ColorPreview(color: Design.Color.background, name: "background")
			ColorPreview(color: Design.Color.content, name: "content")
			ColorPreview(color: Design.Color.group, name: "group")
			ColorPreview(color: Design.Color.shadow, name: "shadow")
			ColorPreview(color: Design.Color.accessory, name: "accessory")
			ColorPreview(color: Design.Color.accent, name: "accent")
			ColorPreview(color: Design.Color.secondaryAccent, name: "secondaryAccent")
			ColorPreview(color: Design.Color.overBackground, name: "overBackground")
			ColorPreview(color: Design.Color.overContent, name: "overContent")
			ColorPreview(color: Design.Color.overAccent, name: "overAccent")
		}
		.previewLayout(.sizeThatFits)
		.padding(16)
	}
}
