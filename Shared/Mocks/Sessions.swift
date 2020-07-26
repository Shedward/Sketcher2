//
//  Sessions.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {

	static let session = Session(name: "Группы людей", preview: Images.session1)

    static let sessions: [Session] = [
        Session(name: "Группы людей", preview: Images.session2),
        Session(name: "Интерьеры", preview: Images.session3),
        Session(name: "Пейзажи и вода 2", preview: Images.session4),
        Session(name: "Архитектура", preview: Images.session5),
        Session(name: "Цвет и свет", preview: Images.session6),
        Session(name: "Композиция", preview: Images.session7)
    ]
}
