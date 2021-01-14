//
//  ViewFactory+SourceTypeSelector.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sourceTypeSelector() -> AnyView {
		let viewModel = SourceTypeSelectorView.ViewModel()
		let view = SourceTypeSelectorView(viewModel: viewModel)
		return AnyView(view)
	}
}
