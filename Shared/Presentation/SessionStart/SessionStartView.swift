//
//  SessionStartView.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import SwiftUI

struct SessionStartView: View {
	@Environment(\.colorScheme) var colorScheme

	let session: Session
	let spacingLevel: Design.SpacingLevel = .level0

    var body: some View {
		ZStack(alignment: .bottom) {
			Image(uiImage: session.preview)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
				.layoutPriority(-1)
			let blurStyle: UIBlurEffect.Style = colorScheme == .light
				? .systemUltraThinMaterialDark
				: .systemUltraThinMaterialLight

			VStack {
				Spacer()
				VStack(spacing: 0) {
					Text(session.name)
						.font(Design.Font.h1)
						.foregroundColor(Design.Color.overContent)
					FixedSpacer(height: 2.0 * spacingLevel.value)
					HStack(spacing: spacingLevel.value) {
						ForEach(SessionProperties(session: session).items) { item in
							SessionPropertyView(
								sessionProperty: item,
								spacingLevel: spacingLevel.next(by: 2)
							)
						}
					}
					FixedSpacer(height: 2.0 * spacingLevel.value)
					ActionButton(title: "Начать", style: .overlay)
					ActionButton(title: "Настроить", style: .overlaySecondary)
				}
				.padding(spacingLevel.value)
				.frame(maxWidth: .infinity)
				.background(
					VisualEffectView(
						effect: UIBlurEffect(style: blurStyle)
					)
				)
				.cornerRadius(spacingLevel.value)
			}
			.padding(spacingLevel.value)
		}
    }
}

struct SessionStart_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			SessionStartView(session: Mocks.session)
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.light)
			SessionStartView(session: Mocks.session)
				.preferredColorScheme(.dark)
		}
    }
}
