//
//  ViewFactory+Session.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func session(_ session: Session) -> some View {
		let viewModel = SessionView.ViewModel(session: session)
		let view = SessionView(viewModel: viewModel)
		return view
	}
}
