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
				name: string("Лица"),
				preview: Images.session10,
				imageCount: 20,
				imageTime: 30,
				lastPractice: nil,
				author: nil
			),
            reason: string("Выбор редакции")
        ),
        RecommendedSession(
            session: Session(
				name: string("Позы"),
				preview: Images.session8,
				imageCount: 40,
				imageTime: 60,
				lastPractice: nil,
				author: string("@some_author")
			),
            reason: string("Выбор редакции")
        ),
        RecommendedSession(
            session: Session(
				name: string("Пейзажи"),
				preview: Images.session9,
				imageCount: 8,
				imageTime: 300,
				lastPractice: nil,
				author: string("@me")
			),
            reason: string("Выбор редакции")
        ),
        RecommendedSession(
            session: Session(
				name: string("Натюрморты"),
				preview: Images.session5,
				imageCount: 20,
				imageTime: 300,
				lastPractice: nil,
				author: nil
			),
            reason: string("Выбор редакции")
        )
    ]
}
