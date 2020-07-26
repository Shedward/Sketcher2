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
            session: Session(name: "Лица", preview: Images.session7),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Позы", preview: Images.session8),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Пейзажи", preview: Images.session9),
            reason: "Выбор редакции"
        ),
        RecomendedSession(
            session: Session(name: "Натюрморты", preview: Images.session10),
            reason: "Выбор редакции"
        )
    ]
}
