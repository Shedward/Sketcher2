//
//  SourceListEditBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import Foundation
import UIKit

struct SourceListEditBehaviour: SourceListBehaviour {
	let cellSelectionMode: SourceListSelectionMode = .normal

	private(set) var sources: [Source]
	let topDrawerSources: [Source] = []
	private(set) var selectedSources: [Source] = []

	let navigationBarAction: ActionItem?
	private(set) var bottomBarActions: [ActionItem] = []

	init(sources: [Source], onCancel: @escaping () -> Void, onDelete: @escaping ([Source]) -> Void) {
		self.sources = sources
		navigationBarAction = .init(title: Localised.string("Отмена"), action: onCancel)
		bottomBarActions = [
			.init(icon: UIImage(named: "delete")) { [self] in
				onDelete(selectedSources)
			}
		]
	}

	mutating func didSelectSource(_ source: Source) {
		selectedSources.append(source)
	}
}
