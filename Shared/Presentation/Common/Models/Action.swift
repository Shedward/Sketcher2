//
//  Action.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import UIKit

struct ActionItem: Identifiable {
	let id: String
	let title: String?
	let icon: UIImage?
	let action: () -> Void

	init(
		id: String = UUID().uuidString,
		title: String? = nil,
		icon: UIImage? = nil,
		action: @escaping () -> Void
	) {
		self.id = id
		self.title = title
		self.icon = icon
		self.action = action
	}
}
