//
//  UserSessionsViewModel.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 09.01.2021.
//

import SwiftUI

extension UserSessionsView {
	final class ViewModel: ObservableObject {
		typealias Dependencies = SessionsRepositoryDependency

		private let dependencies: Dependencies

		@Published var sessions: [Session]
		@Published var openedSession: Session?

		init(dependencies: Dependencies) {
			self.dependencies = dependencies

			sessions = dependencies.sessionsRepository.sessions()
		}

		func openSession(_ session: Session) {
			openedSession = session
		}
	}
}
