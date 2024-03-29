//
//  SourcesRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

protocol SourcesRepository {
	func add(source: Source)
	func remove(sources: [Source])
	func sources() -> [Source]
}
