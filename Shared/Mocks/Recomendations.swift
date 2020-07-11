//
//  Recomendations.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

extension Mocks {
    static let recomendations: [RecomendedSession] = [
        RecomendedSession(
            session: Session(name: "Лица", preview: UIImage()),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Позы", preview: UIImage()),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Пейзажи", preview: UIImage()),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Натюрморты", preview: UIImage()),
            reason: "Выбор редакции"
        )
    ]
}
