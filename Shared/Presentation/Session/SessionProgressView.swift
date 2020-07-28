//
//  SessionProgressView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 29.07.2020.
//

import SwiftUI

struct SessionProgressView: View {
	@State var progress: Float
	let spacingLevel: Design.SpacingLevel = .level3

	var body: some View {
		ZStack {
			BluredMaterial()
			GeometryReader { geometry in
				let totalWidth = geometry.frame(in: .local).width
				let width = totalWidth * CGFloat(self.progress)
				Rectangle()
					.foregroundColor(Design.Color.overAccent)
					.cornerRadius(2)
					.padding(1)
					.frame(width: width, alignment: .leading)
			}
		}
		.cornerRadius(spacingLevel.next.value)
		.frame(
			width: 10 * spacingLevel.value,
			height: spacingLevel.value
		)
	}
}

struct SessionProgressView_Preview: PreviewProvider {
	static var previews: some View {
		VStack {
			SessionProgressView(progress: 0)
			SessionProgressView(progress: 0.3)
			SessionProgressView(progress: 0.6)
			SessionProgressView(progress: 1)
		}
		.background(Design.Color.background)
	}
}
