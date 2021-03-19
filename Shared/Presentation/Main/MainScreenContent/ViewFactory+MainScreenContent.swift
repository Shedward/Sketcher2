//
//  ViewFactory+MainScreenContent.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension ViewFactory {
	func mainScreenContent(spacingLevel: Design.SpacingLevel) -> some View {
		let viewModel = MainScreenContentView.ViewModel(dependencies: dependencies)
		let view = MainScreenContentView(viewModel: viewModel, spacingLevel: spacingLevel)
		return view
	}
}
