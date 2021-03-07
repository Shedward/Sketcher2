//
//  SourceListViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 18.01.2021.
//

import Combine
import SwiftUI

extension SourceListView {
    final class ViewModel: ObservableObject {
        typealias Dependencies = SourcesRepositoryDependency

		@Published
		private var behaviour: SourceListBehaviour!

		private let dependencies: Dependencies

		var sources: [Source] { behaviour.sources }
		var selectedSources: [Source] { behaviour.topDrawerSources }
		var navigationBarAction: ActionItem? { behaviour.navigationBarAction }
		var cellSelectionMode: SourceListSelectionMode { behaviour.cellSelectionMode }

		init(dependencies: Dependencies) {
			self.dependencies = dependencies

			switchToEdit()
        }

		private func switchToList() {
			behaviour = SourceListDisplayBehaviour(
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
			behaviour = SourceListEditBehaviour(
				sources: dependencies.sourcesRepository.sources(),
				onCancel: { [weak self] in
					self?.switchToList()
				},
				onDelete: { [weak self] sources in
					self?.dependencies.sourcesRepository.remove(sources: sources)
				}
			)
		}

		private func switchToMultiselect(selected: [Source]) {
		}

		private func openSource(_ source: Source) {
		}
    }
}
