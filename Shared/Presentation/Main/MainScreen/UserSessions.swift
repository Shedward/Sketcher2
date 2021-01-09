//
//  UserSessionsView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct UserSessionsView: View {
    let sessions: [Session]
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
        ) {
            ForEach(sessions, id: \.id) { session in
                SessionCell(
                    image: session.preview,
                    title: session.name,
                    subtitle: nil,
                    spacingLevel: spacingLevel.next(by: 2)
                )
				.onTapGesture {
					openSession = session
				}
            }
		}
		.sheet(item: $openSession) { session in
			SessionView(session: session)
		}
    }
}

struct UserSessions_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            UserSessionsView(
                sessions: Mocks.sessions,
                spacingLevel: .level0
            )
        }
        .padding(Design.SpacingLevel.level0.value)
    }
}
