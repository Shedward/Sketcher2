//
//  ViewsFactory+MainScreen.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func mainScreen() -> AnyView {
		let view = MainScreenView(
			progress: [],
			recommendations: [],
			sessions: []
		)

		return AnyView(view)
	}
}
