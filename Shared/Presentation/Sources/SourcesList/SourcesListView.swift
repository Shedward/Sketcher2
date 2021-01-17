//
//  SourcesListView.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.10.2020.
//

import SwiftUI

struct SourcesListView: View {

	private enum Route: Equatable, Identifiable {
		var id: Route {
			self
		}

		case newSource
	}

	@Environment(\.viewFactory)
	private var viewFactory: ViewFactory

	@State
	private var openRoute: Route?

    @ObservedObject
    var viewModel: ViewModel

	let spacingLevel = Design.SpacingLevel.level0

	var body: some View {
		VStack(alignment: .leading) {
			NavigationBar(title: Localised.string("Источники"), showBackButton: true)
			ScrollView {
				LazyVStack(spacing: spacingLevel.next.value) {
                    ForEach(viewModel.sources, id: \.id) { source in
						SourceCell(source: source)
					}
				}
			}
			HStack {
				Spacer()
				Image("add")
					.onTapGesture {
						self.openRoute = .newSource
					}
			}
			.padding(
				EdgeInsets(
					top: spacingLevel.next.value,
					leading: spacingLevel.value,
					bottom: 0,
					trailing: 0
				)
			)
		}
		.padding(spacingLevel.value)
		.navigationBarRemoved()
		.sheet(item: $openRoute) { route -> AnyView in
			switch route {
			case .newSource:
				viewFactory.sourceTypeSelector()
			}
		}
	}
}

struct SourcesList_Previews: PreviewProvider {
	static var previews: some View {
        SourcesListView(viewModel: .init(dependencies: MockDependencies()))
	}
}
