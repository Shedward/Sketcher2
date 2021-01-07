//
//  ProgressHeaderViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension ProgressHeaderView {
	final class ViewModel: ObservableObject {
		typealias Dependencies = ProgressRepositoryDependency

		@Published var progressItems: [ProgressItem]

		private let dependencies: Dependencies

		init(dependencies: Dependencies) {
			self.dependencies = dependencies

			progressItems = dependencies.progressRepository.recentProgress()
		}
	}
}
