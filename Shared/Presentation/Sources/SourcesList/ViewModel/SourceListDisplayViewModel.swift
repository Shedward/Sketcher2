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

	private var behaviourSubscriptions = Subscriptions()

	@Published var sources: [Source] = []
	@Published var topDrawerSources: [Source] = []
	@Published var selectedSources: [Source] = []
	@Published var navigationBarAction: ActionItem?
	@Published var bottomBarActions: [ActionItem] = []
	@Published var cellSelectionMode: SourceListSelectionMode = .none
	@Published var openRoute: SourceListViewRoutes?

	var openRouteBinding: Binding<SourceListViewRoutes?> {
		Binding(to: \.openRoute, on: self)
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
			onAdd: { [weak self] in
				self?.createSource()
			},
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

	private func createSource() {
		openRoute = .newSource
	}

	private func openSource(_ source: Source) {
		openRoute = .openSource(source)
	}

	private func bindBehaviour() {
		behaviourSubscriptions = Subscriptions()

		behaviour.$sources
			.assign(to: \.sources, on: self)
			.store(in: &behaviourSubscriptions)

		behaviour.$topDrawerSources
			.assign(to: \.topDrawerSources, on: self)
			.store(in: &behaviourSubscriptions)

		behaviour.$selectedSources
			.assign(to: \.selectedSources, on: self)
			.store(in: &behaviourSubscriptions)

		behaviour.$navigationBarAction
			.assign(to: \.navigationBarAction, on: self)
			.store(in: &behaviourSubscriptions)

		behaviour.$bottomBarActions
			.assign(to: \.bottomBarActions, on: self)
			.store(in: &behaviourSubscriptions)

		behaviour.$cellSelectionMode
			.assign(to: \.cellSelectionMode, on: self)
			.store(in: &behaviourSubscriptions)
	}
}
