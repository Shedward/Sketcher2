//
//  SessionView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct SessionView: View {
	let session: Session

    var body: some View {
		ZStack {
			Image(uiImage: session.preview)
				.resizable()
				.aspectRatio(contentMode: .fit)
			VStack {
				HStack {
					if let imageCount = session.imageCount {
						BadgeView(text: Localised.number(imageCount))
					}
					Spacer()
					if let author = session.author {
						BadgeView(text: author)
					}
				}
				Spacer()
				SessionProgressView(progress: 0.6)
			}
			.padding(Design.SpacingLevel.level0.value)
		}
		.edgesIgnoringSafeArea(.all)
		.background(Design.Color.background)
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
		SessionView(session: Mocks.session)
    }
}
