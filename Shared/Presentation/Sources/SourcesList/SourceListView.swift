//
//  SourcesListView.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.10.2020.
//

import SwiftUI
import Combine

struct SourceListView<ViewModel: SourceListViewModel>: View {

	@Environment(\.viewFactory)
	private var viewFactory: ViewFactory

	@State
	private var openRoute: SourceListViewRoutes?
	private var cancellable = Set<AnyCancellable>()

    @ObservedObject
    var viewModel: ViewModel

	let spacingLevel = Design.SpacingLevel.level0

	init(viewModel: ViewModel) {
		self.viewModel = viewModel
		viewModel.openRoute.assign(to: \.openRoute, on: self).store(in: &cancellable)
	}

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
				return AnyView(viewFactory.sourceTypeSelector())
			case .openSource(let source):
				return AnyView(Text("Open source \(source.title)"))
			}
		}
	}

	private func contentView() -> some View {
		ScrollView {
			VStack(spacing: spacingLevel.value) {
				if !viewModel.topDrawerSources.isEmpty {
					VStack(spacing: spacingLevel.next.value) {
						ForEach(viewModel.topDrawerSources, id: \.id) { source in
							sourceCell(for: source, inDrawer: true)
						}
					}
					SeparatorView()
				}

				LazyVStack(spacing: spacingLevel.next.value) {
					ForEach(viewModel.sources, id: \.id) { source in
						sourceCell(for: source, inDrawer: false)
					}
				}
			}
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

	private func sourceCell(for source: Source, inDrawer: Bool) -> some View {
		SourceCell(source: source, icon: icon(for: source, inDrawer: inDrawer))
			.onTapGesture {
				viewModel.didSelectSource(source)
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
				? UIImage(named: "remove")
				: UIImage(named: "add")
		}
	}
}

struct SourcesList_Previews: PreviewProvider {
	static var previews: some View {
		SourceListView(viewModel: SourceListViewModelDisplayViewModel(dependencies: MockDependencies()))
	}
}
