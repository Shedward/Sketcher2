//
//  ViewFactory+UserSessions.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 09.01.2021.
//

import SwiftUI

extension ViewFactory {
	func userSessions(spacingLevel: Design.SpacingLevel) -> some View {
		let viewModel = UserSessionsView.ViewModel(dependencies: dependencies)
		let view = UserSessionsView(viewModel: viewModel, spacingLevel: spacingLevel)
		return view
	}
}
