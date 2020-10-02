//
//  NewSources.swift
//  iOS
//
//  Created by Vlad Maltsev on 02.08.2020.
//

import UIKit

extension Mocks {
	static let newSource = NewSource(
		title: "Руки и кисти",
		preview: [
			AsyncImages.Mock(image: Images.session3, timeout: 1.0),
			AsyncImages.Mock(image: Images.session4, timeout: 1.0),
			AsyncImages.Mock(image: Images.session5, timeout: 1.0)
		]
	)
}
