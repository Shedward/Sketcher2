//
//  MockDependencyContainer.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

struct MockDependencies: AllDependencies {
	let sessionsRepository: SessionsRepository = InMemorySessionsRepository(initialSessions: Mocks.sessions)
	let sourcesRepository: SourcesRepository = InMemorySourcesRepository(initialSources: Mocks.sourcesList)
	let progressRepository: ProgressRepository = MockProgressRepository()
}
