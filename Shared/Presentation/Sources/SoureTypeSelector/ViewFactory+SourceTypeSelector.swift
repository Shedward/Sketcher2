//
//  ViewFactory+SourceTypeSelector.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sourceTypeSelector() -> AnyView {
		let view = SourceTypeSelectorView(sections: [])
		return AnyView(view)
	}
}
