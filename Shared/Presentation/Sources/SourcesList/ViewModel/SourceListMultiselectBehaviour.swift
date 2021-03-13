//
//  SourceListMultiselectBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.03.2021.
//

import Foundation
import UIKit

struct SourceListMultiselectBehaviour: SourceListBehaviour {
	let cellSelectionMode: SourceListSelectionMode = .ordered

	private let allSources: [Source]
	var sources: [Source] {
		allSources.filter { source in
			!topDrawerSources.contains { $0.id == source.id }
		}
	}
	private(set) var topDrawerSources: [Source] = []
	let selectedSources: [Source] = []

	let navigationBarAction: ActionItem?
	private(set) var bottomBarActions: [ActionItem] = []

	init(sources: [Source], onSelect: @escaping () -> Void) {
		allSources = sources
		navigationBarAction = .init(title: Localised.string("Выбрать"), action: onSelect)
	}

	mutating func didSelectSource(_ source: Source) {
		if topDrawerSources.contains(where: { $0.id == source.id }) {
			topDrawerSources = topDrawerSources.filter { $0.id != source.id }
		} else {
			topDrawerSources.append(source)
		}
	}
}
