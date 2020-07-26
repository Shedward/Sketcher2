//
//  SessionProperties.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import Foundation

struct SessionProperty: Identifiable {
	let id = UUID()
	let iconName: String
	let value: String
}

struct SessionProperties {
	let items: [SessionProperty]

	init(session: Session) {
		items = [
			Self.imageDurationProperty(for: session),
			Self.imageCount(for: session),
			Self.lastPractice(for: session)
		]
	}

	private static func imageDurationProperty(for session: Session) -> SessionProperty {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .abbreviated
		formatter.allowedUnits = [.second, .minute, .hour]
		let description = formatter.string(from: session.imageTime) ?? Localized.string("-")

		return SessionProperty(
			iconName: "time",
			value: description
		)
	}

	private static func imageCount(for session: Session) -> SessionProperty {
		SessionProperty(
			iconName: "images",
			value: session.imageCount.map { Localized.number($0) } ?? Localized.string("∞")
		)
	}

	private static func lastPractice(for session: Session) -> SessionProperty {
		let value: String
		if let lastPractice = session.lastPractice {
			let calendar = Calendar.current

			let fromDate: Date = calendar.startOfDay(for: lastPractice)
			let toDate: Date = calendar.startOfDay(for: Date())

			let difference = calendar.dateComponents([.day], from: fromDate, to: toDate)

			let formatter = DateComponentsFormatter()
			formatter.unitsStyle = .abbreviated
			formatter.allowedUnits = [.day]

			value = formatter.string(from: difference) ?? Localized.string("-")
		} else {
			value = Localized.string("-")
		}

		return SessionProperty(iconName: "progress2", value: value)
	}
}
