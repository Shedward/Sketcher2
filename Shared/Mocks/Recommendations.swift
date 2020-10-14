//
//  Recommendations.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {
    static let recommendations: [RecommendedSession] = [
        RecommendedSession(
			session: Session(
				name: "Лица",
				preview: Images.session10,
				imageCount: 20,
				imageTime: 30,
				lastPractice: nil,
				author: nil
			),
            reason: "Выбор редакции"
        ),
        RecommendedSession(
            session: Session(
				name: "Позы",
				preview: Images.session8,
				imageCount: 40,
				imageTime: 60,
				lastPractice: nil,
				author: "@some_author"
			),
            reason: "Выбор редакции"
        ),
        RecommendedSession(
            session: Session(
				name: "Пейзажи",
				preview: Images.session9,
				imageCount: 8,
				imageTime: 300,
				lastPractice: nil,
				author: "@me"
			),
            reason: "Выбор редакции"
        ),
        RecommendedSession(
            session: Session(
				name: "Натюрморты",
				preview: Images.session5,
				imageCount: 20,
				imageTime: 300,
				lastPractice: nil,
				author: nil
			),
            reason: "Выбор редакции"
        )
    ]
}
