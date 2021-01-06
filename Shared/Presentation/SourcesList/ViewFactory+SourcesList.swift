//
//  ViewFactory+SourcesList.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sourcesList() -> AnyView {
		let view = SourcesListView(sources: [])
		return AnyView(view)
	}
}
