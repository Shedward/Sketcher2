//
//  SourceTypeSelectorViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 09.01.2021.
//

import SwiftUI

extension SourceTypeSelectorView {
	final class ViewModel: ObservableObject {

		@Published
		var sections: [SourceTypeSection]

		init() {
			sections = [
				SourceTypeSection(
					title: Localised.string("Генерируемые"),
					sourceTypes: [.debug]
				)
			]
		}
	}
}
