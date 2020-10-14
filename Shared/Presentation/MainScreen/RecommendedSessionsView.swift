//
//  RecommendedSessionsView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct RecommendedSessionsView: View {
    let recommendations: [RecommendedSession]
    let spacingLevel: Design.SpacingLevel

	@State
	private var openSession: Session?

    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 150), spacing: spacingLevel.value)
            ],
            alignment: .center,
            spacing: spacingLevel.next.value
        ){
            ForEach(recommendations, id: \.session.id) { recommendation in
                SessionCell(
                    image: recommendation.session.preview,
                    title: recommendation.session.name,
                    subtitle: recommendation.reason,
                    spacingLevel: spacingLevel.next(by: 2)
                )
				.onTapGesture {
					openSession = recommendation.session
				}
            }
        }
		.sheet(item: $openSession) { session in
			SessionStartView(session: session)
		}
    }
}

struct RecommendedSessions_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecommendedSessionsView(
                recommendations: Mocks.recommendations,
                spacingLevel: .level0
            )
        }
        .padding(Design.SpacingLevel.level0.value)
    }
}
