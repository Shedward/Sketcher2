//
//  InMemorySourcesRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

final class InMemorySourcesRepository: SourcesRepository {
	private var sourcesStorage: [Source] = []

	func add(source: Source) {
		sourcesStorage.append(source)
	}

	func remove(source: Source) {
		sourcesStorage = sourcesStorage.filter { $0.id != source.id }
	}

	func sources() -> [Source] {
		sourcesStorage
	}
}
