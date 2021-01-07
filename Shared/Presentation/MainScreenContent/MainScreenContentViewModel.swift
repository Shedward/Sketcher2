//
//  MainScreenViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension MainScreenContentView {
	final class ViewModel: ObservableObject {
		typealias Dependencies = ProgressRepositoryDependency
			& SessionsRepositoryDependency


		enum ProgressState {
			case notConfigured
			case progress
		}

		@Published private(set) var progressState: ProgressState
		@Published private(set) var showRecommendations: Bool
		@Published private(set) var showUserSessions: Bool

		private let dependencies: Dependencies

		init(dependencies: Dependencies) {
			self.dependencies = dependencies

			progressState = dependencies.progressRepository.isConfigured
				? .progress
				: .notConfigured

			showRecommendations = false
			showUserSessions = !dependencies.sessionsRepository.sessions().isEmpty
		}
	}
}
