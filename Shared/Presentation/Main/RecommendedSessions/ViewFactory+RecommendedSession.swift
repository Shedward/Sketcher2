//
//  ViewFactory+RecommendedSession.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 07.01.2021.
//

import SwiftUI

extension ViewFactory {
	func recommendedSessions(spacingLevel: Design.SpacingLevel) -> some View {
		let viewModel = RecommendedSessionsView.ViewModel(dependencies: dependencies)
		let view = RecommendedSessionsView(viewModel: viewModel, spacingLevel: spacingLevel)
		return view
	}
}
