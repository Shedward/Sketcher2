//
//  SourceListViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import SwiftUI

enum SourceListSelectionMode {
	case none
	case normal
	case ordered
}

protocol SourceListScenarioBehaviour {
	var sources: [Source] { get }
	var topDrawerSources: [Source] { get }
	var selectedSources: [Source] { get }
	var cellSelectionMode: SourceListSelectionMode { get }

	var navigationBarAction: ActionItem? { get }
	var bottomBarActions: [ActionItem] { get }

	mutating func didSelectSource(_ source: Source)
}
