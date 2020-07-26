//
//  RecomendedSessionsView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct RecomendedSessionsView: View {
    let recomendations: [RecomendedSession]
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
            ForEach(recomendations, id: \.session.id) { recomendation in
                SessionCell(
                    image: recomendation.session.preview,
                    title: recomendation.session.name,
                    subtitle: recomendation.reason,
                    spacingLevel: spacingLevel.next(by: 2)
                )
				.onTapGesture {
					openSession = recomendation.session
				}
            }
        }
		.sheet(item: $openSession) { session in
			SessionStartView(session: session)
		}
    }
}

struct RecomendedSessions_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecomendedSessionsView(
                recomendations: Mocks.recomendations,
                spacingLevel: .level0
            )
        }
        .padding(Design.SpacingLevel.level0.value)
    }
}
