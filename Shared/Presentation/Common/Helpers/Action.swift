//
//  Action.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.01.2021.
//

import UIKit

struct ActionItem {
	let title: String?
	let icon: UIImage?
	let action: () -> Void

	init(title: String? = nil, icon: UIImage? = nil, action: @escaping () -> Void) {
		self.title = title
		self.icon = icon
		self.action = action
	}
}
