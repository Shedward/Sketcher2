//
//  Sources.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.10.2020.
//

import Foundation

extension Mocks {
	static let source = Source(
		id: UUID(),
		title: "Рисунки жуков",
		author: .init(type: .debug, name: "Debug"),
		preview: [
			AsyncImages.Mock(image: Images.session3, timeout: 1.0),
			AsyncImages.Mock(image: Images.session4, timeout: 1.0),
			AsyncImages.Mock(image: Images.session5, timeout: 1.0)
		]
	)

	static let sourcesList: [Source] = [
		Source(
			id: UUID(),
			title: "Люди и лица",
			author: .init(type: .debug, name: "Debug"),
			preview: [
				AsyncImages.Mock(image: Images.session1),
				AsyncImages.Mock(image: Images.session2),
				AsyncImages.Mock(image: Images.session3)
			]
		),
		Source(
			id: UUID(),
			title: "Руки",
			author: .init(type: .debug, name: "Debug"),
			preview: [
				AsyncImages.Mock(image: Images.session2),
				AsyncImages.Mock(image: Images.session3),
				AsyncImages.Mock(image: Images.session4)
			]
		),
		Source(
			id: UUID(),
			title: "Жесты и цвет. Референсы паттернов и прочее для композиции",
			author: .init(type: .debug, name: "Debug"),
			preview: [
				AsyncImages.Mock(image: Images.session5),
				AsyncImages.Mock(image: Images.session6),
				AsyncImages.Mock(image: Images.session7)
			]
		),
		Source(
			id: UUID(),
			title: "Скетчи",
			author: .init(type: .debug, name: "Debug"),
			preview: [
				AsyncImages.Mock(image: Images.session8),
				AsyncImages.Mock(image: Images.session9),
				AsyncImages.Mock(image: Images.session10)
			]
		),
		Source(
			id: UUID(),
			title: "Пейзажи норвегии",
			author: .init(type: .debug, name: "Debug"),
			preview: [
				AsyncImages.Mock(image: Images.session5),
				AsyncImages.Mock(image: Images.session8),
				AsyncImages.Mock(image: Images.session1)
			]
		)
	]
}
