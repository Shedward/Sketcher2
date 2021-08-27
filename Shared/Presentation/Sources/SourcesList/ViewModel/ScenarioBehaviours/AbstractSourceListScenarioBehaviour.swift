//
//  SourceListViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import SwiftUI
import Combine

enum SourceListSelectionMode {
	case none
	case selection
	case orderedSelection
}

class AbstractSourceListScenarioBehaviour {
	@Published var sources: [Source] = []
	@Published var topDrawerSources: [Source] = []

	@Published var selectedSources: [Source] = []
	@Published var cellSelectionMode: SourceListSelectionMode = .none

	@Published var navigationBarAction: ActionItem?
	@Published var bottomBarActions: [ActionItem] = []

	func didSelectSource(_ source: Source) {
		assertionFailure("Not implemented")
	}
}
