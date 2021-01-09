//
//  SessionStartView.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import SwiftUI

struct SessionStartView: View {
	let session: Session
	let spacingLevel: Design.SpacingLevel = .level0

	@Environment(\.viewFactory)
	private var viewFactory: ViewFactory

	@State
	private var openSession: Session?

    var body: some View {
		ZStack(alignment: .bottom) {
			Image(uiImage: session.preview)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
				.layoutPriority(-1)
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
					ActionButton(title: Localised.string("Начать"), style: .overlay)
						.onTapGesture {
							self.openSession = self.session
						}
					ActionButton(title: Localised.string("Настроить"), style: .overlaySecondary)
				}
				.padding(spacingLevel.value)
				.frame(maxWidth: .infinity)
				.background(BlurredMaterial())
				.cornerRadius(spacingLevel.value)
			}
			.padding(spacingLevel.value)
		}
		.fullScreenCover(item: $openSession) { session in
			viewFactory.session(session)
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
