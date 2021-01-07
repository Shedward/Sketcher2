//
//  ViewsFactory.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

struct ViewFactory {
	typealias Dependencies = RepositoriesDependencies

	let dependencies: Dependencies

	static let mock = ViewFactory(dependencies: MockDependencies())
}
