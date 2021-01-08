//
//  RecommendedSessionsViewModel.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension RecommendedSessionsView {
	final class ViewModel: ObservableObject {
		typealias Dependencies = SessionsRepositoryDependency

		@Published var recommendations: [RecommendedSession]
		@Published var openedRecommendation: RecommendedSession?

		private let dependencies: Dependencies

		init(dependencies: Dependencies) {
			self.dependencies = dependencies
			recommendations = []
		}

		func openRecommendation(_ session: RecommendedSession) {
			openedRecommendation = session
		}
	}
}
