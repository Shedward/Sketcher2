//
//  SourceListDisplayViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 18.01.2021.
//

import Combine
import SwiftUI

final class SourceListViewModelDisplayViewModel: SourceListViewModel {
	typealias Dependencies = SourcesRepositoryDependency

	@Published
	private var behaviour: SourceListScenario!

	private let dependencies: Dependencies

	var sources: [Source] { behaviour.sources }
	var topDrawerSources: [Source] { behaviour.topDrawerSources }
	var selectedSources: [Source] { behaviour.selectedSources }
	var navigationBarAction: ActionItem? { behaviour.navigationBarAction }
	var cellSelectionMode: SourceListSelectionMode { behaviour.cellSelectionMode }

	@State
	var openRouteState: SourceListViewRoutes?
	var openRoute: Binding<SourceListViewRoutes?> { $openRouteState }

	init(dependencies: Dependencies) {
		self.dependencies = dependencies

		switchToList()
	}

	func didSelectSource(_ source: Source) {
		behaviour.didSelectSource(source)
	}

	private func switchToList() {
		behaviour = SourceListDisplayScenario(
			sources: dependencies.sourcesRepository.sources(),
			onEdit: { [weak self] in
				self?.switchToEdit()
			},
			onOpenSource: { [weak self] source in
				self?.openSource(source)
			}
		)
	}

	private func switchToEdit() {
		behaviour = SourceListEditScenario(
			sources: dependencies.sourcesRepository.sources(),
			onCancel: { [weak self] in
				self?.switchToList()
			},
			onDelete: { [weak self] sources in
				self?.dependencies.sourcesRepository.remove(sources: sources)
			}
		)
	}

	private func openSource(_ source: Source) {
		openRouteState = .openSource(source)
	}
}
