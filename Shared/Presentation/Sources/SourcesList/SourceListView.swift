//
//  SourcesListView.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.10.2020.
//

import SwiftUI

struct SourceListView: View {

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
			NavigationBar(
				title: Localised.string("Источники"),
				showBackButton: true,
				customAction: viewModel.navigationBarAction
			)
			contentView()
			bottomButtons()
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

	private func contentView() -> some View {
		ScrollView {
			VStack(spacing: spacingLevel.value) {
				if !viewModel.selectedSources.isEmpty {
					VStack(spacing: spacingLevel.next.value) {
						ForEach(viewModel.selectedSources, id: \.id) { source in
							SourceCell(source: source, icon: icon(for: source, inDrawer: true))
						}
					}
					SeparatorView()
				}

				LazyVStack(spacing: spacingLevel.next.value) {
					ForEach(viewModel.sources, id: \.id) { source in
						SourceCell(source: source, icon: icon(for: source, inDrawer: false))
					}
				}
			}
		}
	}

	private func icon(for source: Source, inDrawer: Bool) -> UIImage? {
		switch viewModel.cellSelectionMode {
		case .none:
			return nil
		case .normal:
			if !inDrawer {
				let isSelected = viewModel.selectedSources.contains { $0.id == source.id }
				return isSelected
					? UIImage(named: "checked")
					: UIImage(named: "unchecked")
			} else {
				return nil
			}
		case .ordered:
			return inDrawer
				? UIImage(named: "add")
				: UIImage(named: "remove")
		}
	}

	private func bottomButtons() -> some View {
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
}

struct SourcesList_Previews: PreviewProvider {
	static var previews: some View {
		SourceListView(viewModel: .init(dependencies: MockDependencies()))
	}
}
