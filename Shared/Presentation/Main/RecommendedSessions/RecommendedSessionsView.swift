//
//  RecommendedSessionsView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

struct RecommendedSessionsView: View {
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
			ForEach(viewModel.recommendations, id: \.session.id) { recommendation in
                SessionCell(
                    image: recommendation.session.preview,
                    title: recommendation.session.name,
                    subtitle: recommendation.reason,
                    spacingLevel: spacingLevel.next(by: 2)
                )
				.onTapGesture {
					viewModel.openRecommendation(recommendation)
				}
            }
        }
		.sheet(item: $viewModel.openedRecommendation) { recommendation in
			viewFactory.sessionStart(recommendation.session)
		}
    }
}

struct RecommendedSessions_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecommendedSessionsView(
				viewModel: .init(dependencies: MockDependencies()),
                spacingLevel: .level0
            )
        }
        .padding(Design.SpacingLevel.level0.value)
    }
}
