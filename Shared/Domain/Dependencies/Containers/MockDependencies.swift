//
//  MockDependencyContainer.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

struct MockDependencies: AllDependencies {
	let sessionsRepository: SessionsRepository = InMemorySessionsRepository()
	let sourcesRepository: SourcesRepository = InMemorySourcesRepository()
	let progressRepository: ProgressRepository = MockProgressRepository()
}
