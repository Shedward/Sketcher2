//
//  SourceListEditUseCase.swift
//  SourceListEditUseCase
//
//  Created by Vlad Maltsev on 27.08.2021.
//

import Combine

final class DefaultSourcesListEditUseCase: SourcesListEditUseCase {
	typealias Dependencies = SourcesRepositoryDependency

	private let dependencies: Dependencies

	private let sourcesSubject: CurrentValueSubject<[Source], Never> = .init([])
	var sources: AnyPublisher<[Source], Never> {
		reload()
		return sourcesSubject.eraseToAnyPublisher()
	}

	init(dependencies: Dependencies) {
		self.dependencies = dependencies
		reload()
	}

	func remove(sources: [Source]) {
		dependencies.sourcesRepository.remove(sources: sources)
		reload()
	}

	private func reload() {
		sourcesSubject.value = dependencies.sourcesRepository.sources()
	}
}
