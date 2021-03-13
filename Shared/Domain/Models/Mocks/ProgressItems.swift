//
//  ProgressItems.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import Foundation

extension Mocks {

	static let todayProgressItem = ProgressItem(level: .normal, date: Date())
	static let progressItems = makeProgressItems(to: Date(), levels: [.normal, .normal, .hight, .none, .none])

	static func makeProgressItems(to endDate: Date, levels: [ProgressItem.Level]) -> [ProgressItem] {
		var date = Calendar.current.date(byAdding: .day, value: -levels.count, to: endDate)
		var levels = levels
		var progressItems: [ProgressItem] = []

		while let currentDate = date, currentDate < endDate, let level = levels.first {
			date = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)
			levels.removeFirst()
			progressItems.append(ProgressItem(level: level, date: currentDate))
		}

		return progressItems
	}
}
