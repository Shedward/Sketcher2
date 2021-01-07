//
//  ViewFactory+ProgressHeader.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension ViewFactory {
	func progressHeader(spacingLevel: Design.SpacingLevel) -> AnyView {
		let viewModel = ProgressHeaderView.ViewModel(dependencies: dependencies)
		let view = ProgressHeaderView(viewModel: viewModel, spacingLevel: spacingLevel)
		return AnyView(view)
	}
}
