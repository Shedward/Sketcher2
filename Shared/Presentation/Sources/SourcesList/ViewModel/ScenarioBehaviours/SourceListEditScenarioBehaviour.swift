//
//  SourceListEditBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import Foundation
import UIKit

final class SourceListEditScenarioBehaviour: AbstractSourceListScenarioBehaviour {
	private let sourcesEditUseCase: SourcesListEditUseCase
	private var subscriptions = Subscriptions()

	init(sourcesEditUseCase: SourcesListEditUseCase, onCancel: @escaping () -> Void) {
		self.sourcesEditUseCase = sourcesEditUseCase
		super.init()
		cellSelectionMode = .selection
		navigationBarAction = .init(title: Localised.string("Отмена"), action: onCancel)
		bottomBarActions = [
			.init(id: "delete", icon: Design.Image.Action.delete) { [weak self] in
				guard let self = self else { return }
				self.sourcesEditUseCase.remove(sources: self.selectedSources)
			}
		]

		sourcesEditUseCase.sources
			.assign(to: \.sources, on: self)
			.store(in: &subscriptions)
	}

	override func didSelectSource(_ source: Source) {
		if selectedSources.contains(where: { $0.id == source.id }) {
			selectedSources = selectedSources.filter { $0.id != source.id }
		} else {
			selectedSources.append(source)
		}
	}
}
