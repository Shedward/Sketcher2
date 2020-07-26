//
//  SessionPropertyView.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import SwiftUI

struct SessionPropertyView: View {
	let sessionProperty: SessionProperty
	let spacingLevel: Design.SpacingLevel

    var body: some View {
		VStack(spacing: spacingLevel.value) {
			Image(sessionProperty.iconName)
				.foregroundColor(Design.Color.overContent)
			Text(sessionProperty.value)
				.font(Design.Font.body1)
				.foregroundColor(Design.Color.overContent)
		}
    }
}

struct SessionPropertyView_Previews: PreviewProvider {
    static var previews: some View {
		HStack(spacing: Design.SpacingLevel.level1.value) {
			ForEach(SessionProperties(session: Mocks.session).items) { item in
				SessionPropertyView(
					sessionProperty: item,
					spacingLevel: .level2
				)
			}
		}
		.background(Design.Color.overBackground)
    }
}
