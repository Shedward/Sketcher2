//
//  InMemorySourcesRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

final class InMemorySourcesRepository: SourcesRepository {
	private var sourcesStorage: [Source] = []

	init(initialSources: [Source]) {
		sourcesStorage = initialSources
	}

	func add(source: Source) {
		sourcesStorage.append(source)
	}

	func remove(source: Source) {
		sourcesStorage = sourcesStorage.filter { $0.id != source.id }
	}

	func remove(sources: [Source]) {
		sourcesStorage = sourcesStorage.filter { source in sources.contains { $0.id == source.id } }
	}

	func sources() -> [Source] {
		sourcesStorage
	}
}
