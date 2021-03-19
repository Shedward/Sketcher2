//
//  ViewFactory+SourcesList.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sourcesList() -> some View {
		let viewModel = SourceListViewModelDisplayViewModel(dependencies: dependencies)
		let view = SourceListView(viewModel: viewModel)
		return view
	}
}
