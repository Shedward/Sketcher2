//
//  ViewFactory+MainScreenContent.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension ViewFactory {
	func mainScreenContent(spacingLevel: Design.SpacingLevel) -> AnyView {
		let viewModel = MainScreenContentView.ViewModel(dependencies: dependencies)
		let view = MainScreenContentView(viewModel: viewModel, spacingLevel: spacingLevel)
		return AnyView(view)
	}
}
