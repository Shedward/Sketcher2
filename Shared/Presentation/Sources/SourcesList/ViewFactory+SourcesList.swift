//
//  ViewFactory+SourcesList.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sourcesList() -> AnyView {
		let viewModel = SourceListView.ViewModel(dependencies: dependencies)
		let view = SourceListView(viewModel: viewModel)
		return AnyView(view)
	}
}
