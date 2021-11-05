//
//  SourceListListBehaviour.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import Combine
import UIKit

final class SourceListDisplayScenarioBehaviour: AbstractSourceListScenarioBehaviour {
	private var sourcesEditUseCase: SourcesListEditUseCase
	private let onOpenSource: (Source) -> Void
	private var subscriptions = Subscriptions()

	init(
		sourcesEditUseCase: SourcesListEditUseCase,
		onAdd: @escaping () -> Void,
		onEdit: @escaping () -> Void,
		onOpenSource: @escaping (Source) -> Void
	) {
		self.sourcesEditUseCase = sourcesEditUseCase
		self.onOpenSource = onOpenSource
		super.init()

		navigationBarAction = .init(title: Localised.string("Изменить"), action: onEdit)
		bottomBarActions = [
			.init(id: "add", icon: UIImage(named: "add"), action: onAdd)
		]

		sourcesEditUseCase.sources
			.assign(to: \.sources, on: self)
			.store(in: &subscriptions)
	}

	override func didSelectSource(_ source: Source) {
		onOpenSource(source)
	}
}
