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
	private var behaviour: SourceListScenarioBehaviour!

	private let dependencies: Dependencies

	var sources: [Source] { behaviour.sources }
	var topDrawerSources: [Source] { behaviour.topDrawerSources }
	var selectedSources: [Source] { behaviour.selectedSources }
	var navigationBarAction: ActionItem? { behaviour.navigationBarAction }
	var bottomBarActions: [ActionItem] { behaviour.bottomBarActions }
	var cellSelectionMode: SourceListSelectionMode { behaviour.cellSelectionMode }

	@Published
	private var openRouteStatePublisher: SourceListViewRoutes?
	var openRoute: AnyPublisher<SourceListViewRoutes?, Never> {
		$openRouteStatePublisher.eraseToAnyPublisher()
	}

	init(dependencies: Dependencies) {
		self.dependencies = dependencies

		switchToList()
	}

	func didSelectSource(_ source: Source) {
		behaviour.didSelectSource(source)
	}

	private func switchToList() {
		behaviour = SourceListDisplayScenarioBehaviour(
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
		behaviour = SourceListEditScenarioBehaviour(
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
		openRouteStatePublisher = .openSource(source)
	}
}
