//
//  UserSessionsView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct UserSessionsView: View {
	@Environment(\.viewFactory)
	private var viewFactory: ViewFactory

	@ObservedObject
	var viewModel: ViewModel

	let spacingLevel: Design.SpacingLevel

    var body: some View {
        LazyVGrid(
            columns: [
				GridItem(.adaptive(minimum: SessionCell.minimumWidth), spacing: spacingLevel.value)
            ],
            alignment: .center,
            spacing: spacingLevel.next.value
        ){
			ForEach(viewModel.sessions, id: \.id) { session in
                SessionCell(
                    image: session.preview,
                    title: session.name,
                    subtitle: nil,
                    spacingLevel: spacingLevel.next
                )
				.onTapGesture {
					viewModel.openSession(session)
				}
            }
		}
		.sheet(item: $viewModel.openedSession) { session in
			viewFactory.sessionStart(session)
		}
    }
}

struct UserSessions_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            UserSessionsView(
				viewModel: .init(dependencies: MockDependencies()),
                spacingLevel: .level1
            )
        }
        .padding(Design.SpacingLevel.level0.value)
    }
}
