//
//  Sessions.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {

	static let session = Session(
		name: string("Группы людей"),
		preview: Images.session1,
		imageCount: 18,
		imageTime: 120,
		lastPractice: Date(timeIntervalSinceNow: -2 * 24 * 60 * 60),
		author: string("@Elise")
	)

    static let sessions: [Session] = [
		Session(
			name: string("Группы людей"),
			preview: Images.session8,
			imageCount: 20,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: string("Интерьеры"),
			preview: Images.session7,
			imageCount: 20,
			imageTime: 30,
			lastPractice: nil,
			author: string("emilie")
		),
        Session(
			name: string("Животные"),
			preview: Images.session4,
			imageCount: 180,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: string("Архитектура"),
			preview: Images.session5,
			imageCount: nil,
			imageTime: 30,
			lastPractice: Date(),
			author: nil
		),
        Session(
			name: string("Цвет и свет"),
			preview: Images.session6,
			imageCount: nil,
			imageTime: 30,
			lastPractice: nil,
			author: nil
		),
        Session(
			name: string("Композиция"),
			preview: Images.session7,
			imageCount: 8000,
			imageTime: 600,
			lastPractice: nil,
			author: nil
		)
    ]
}
