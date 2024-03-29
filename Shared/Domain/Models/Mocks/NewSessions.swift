//
//  NewSessions.swift
//  iOS
//
//  Created by Vlad Maltsev on 21.07.2020.
//

import UIKit

extension Mocks {
	static let newSession = NewSession(
		title: string("Руки и кисти"),
		preview: [
			AsyncImages.Mock(image: Images.session1, timeout: 1.0),
			AsyncImages.Mock(image: Images.session2, timeout: 1.0),
			AsyncImages.Mock(image: Images.session3, timeout: 1.0)
		],
		tags: [string("человек"), string("цвет_и_свет"), string("руки"), string("фотографии")]
	)
}
