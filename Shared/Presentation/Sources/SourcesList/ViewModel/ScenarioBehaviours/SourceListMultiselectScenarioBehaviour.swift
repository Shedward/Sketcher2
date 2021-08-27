//
//  SourceListMultiselectBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.03.2021.
//

import Foundation
import UIKit

final class SourceListMultiselectScenarioBehaviour: AbstractSourceListScenarioBehaviour {
	init(sourcesEditUseCase: SourcesListEditUseCase, onSelect: @escaping () -> Void) {
		super.init()
		navigationBarAction = .init(title: Localised.string("Выбрать"), action: onSelect)
	}

	override func didSelectSource(_ source: Source) {
		if topDrawerSources.contains(where: { $0.id == source.id }) {
			topDrawerSources = topDrawerSources.filter { $0.id != source.id }
		} else {
			topDrawerSources.append(source)
		}
	}
}
