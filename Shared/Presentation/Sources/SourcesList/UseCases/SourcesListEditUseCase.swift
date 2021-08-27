//
//  SourcesListEditUseCase.swift
//  SourcesListEditUseCase
//
//  Created by Vlad Maltsev on 27.08.2021.
//

import Combine

protocol SourcesListEditUseCase {
	var sources: AnyPublisher<[Source], Never> { get }
	func remove(sources: [Source])
}
