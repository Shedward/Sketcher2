//
//  SourceListListBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

struct SourceListDisplayScenario: SourceListScenario {
	let cellSelectionMode: SourceListSelectionMode = .none

	private(set) var sources: [Source]
	let topDrawerSources: [Source] = []
	let selectedSources: [Source] = []

	let navigationBarAction: ActionItem?
	let bottomBarActions: [ActionItem] = []

	private let onOpenSource: (Source) -> Void

	init(sources: [Source], onEdit: @escaping () -> Void, onOpenSource: @escaping (Source) -> Void) {
		self.sources = sources
		self.onOpenSource = onOpenSource
		navigationBarAction = .init(title: Localised.string("Изменить"), action: onEdit)
	}

	func didSelectSource(_ source: Source) {
		onOpenSource(source)
	}
}
