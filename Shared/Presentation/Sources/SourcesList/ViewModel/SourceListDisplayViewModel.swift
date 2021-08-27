//
//  SourceListDisplayViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 18.01.2021.
//

import Combine
import SwiftUI

final class SourceListViewModelDisplayViewModel: SourceListViewModel {
	private let sourcesEditUseCase: SourcesListEditUseCase
	private var behaviour: AbstractSourceListScenarioBehaviour! {
		didSet {
			bindBehaviour()
		}
	}
	private var subscriptions = Subscriptions()

	@Published var sources: [Source] = []
	@Published var topDrawerSources: [Source] = []
	@Published var selectedSources: [Source] = []
	@Published var navigationBarAction: ActionItem?
	@Published var bottomBarActions: [ActionItem] = []
	@Published var cellSelectionMode: SourceListSelectionMode = .none

	@Published private var openRouteStatePublisher: SourceListViewRoutes?
	var openRoute: AnyPublisher<SourceListViewRoutes?, Never> {
		$openRouteStatePublisher.eraseToAnyPublisher()
	}

	init(sourcesEditUseCase: SourcesListEditUseCase) {
		self.sourcesEditUseCase = sourcesEditUseCase

		switchToList()
	}

	func didSelectSource(_ source: Source) {
		behaviour.didSelectSource(source)
	}

	private func switchToList() {
		behaviour = SourceListDisplayScenarioBehaviour(
			sourcesEditUseCase: sourcesEditUseCase,
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
			sourcesEditUseCase: sourcesEditUseCase,
			onCancel: { [weak self] in
				self?.switchToList()
			}
		)
	}

	private func openSource(_ source: Source) {
		openRouteStatePublisher = .openSource(source)
	}

	private func bindBehaviour() {
		behaviour.$sources
			.assign(to: \.sources, on: self)
			.store(in: &subscriptions)

		behaviour.$topDrawerSources
			.assign(to: \.topDrawerSources, on: self)
			.store(in: &subscriptions)

		behaviour.$selectedSources
			.assign(to: \.selectedSources, on: self)
			.store(in: &subscriptions)

		behaviour.$navigationBarAction
			.assign(to: \.navigationBarAction, on: self)
			.store(in: &subscriptions)

		behaviour.$bottomBarActions
			.assign(to: \.bottomBarActions, on: self)
			.store(in: &subscriptions)

		behaviour.$cellSelectionMode
			.assign(to: \.cellSelectionMode, on: self)
			.store(in: &subscriptions)
	}
}
