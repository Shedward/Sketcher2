//
//  Sessions.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {

	static let session = Session(name: "Группы людей", preview: UIImage())

    static let sessions: [Session] = [
        Session(name: "Группы людей", preview: UIImage()),
        Session(name: "Интерьеры", preview: UIImage()),
        Session(name: "Пейзажи и вода 2", preview: UIImage()),
        Session(name: "Архитектура", preview: UIImage()),
        Session(name: "Цвет и свет", preview: UIImage()),
        Session(name: "Композиция", preview: UIImage())
    ]
}
