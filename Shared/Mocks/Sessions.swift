//
//  Sessions.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {

	static let session = Session(
		name: "Группы людей",
		preview: Images.session1,
		imageCount: 18,
		imageTime: 120,
		lastPractice: Date(timeIntervalSinceNow: -2 * 24 * 60 * 60),
		author: "@Elise"
	)

    static let sessions: [Session] = [
		Session(
			name: "Группы людей",
			preview: Images.session8,
			imageCount: 20,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: "Интерьеры",
			preview: Images.session7,
			imageCount: 20,
			imageTime: 30,
			lastPractice: nil,
			author: "emilie"
		),
        Session(
			name: "Животные",
			preview: Images.session4,
			imageCount: 180,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: "Архитектура",
			preview: Images.session5,
			imageCount: nil,
			imageTime: 30,
			lastPractice: Date(),
			author: nil
		),
        Session(
			name: "Цвет и свет",
			preview: Images.session6,
			imageCount: nil,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: "Композиция",
			preview: Images.session7,
			imageCount: 8000,
			imageTime: 600,
			lastPractice: nil,
			author: nil
		)
    ]
}
