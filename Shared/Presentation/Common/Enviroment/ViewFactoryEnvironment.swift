//
//  ViewFactoryEnviroment.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

struct ViewFactoryEnvironmentKey: EnvironmentKey {
	static var defaultValue = ViewFactory.mock
}

extension EnvironmentValues {
	var viewFactory: ViewFactory {
		get { self[ViewFactoryEnvironmentKey.self] }
		set { self[ViewFactoryEnvironmentKey.self] = newValue }
	}
}
