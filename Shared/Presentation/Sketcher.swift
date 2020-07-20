//
//  Sketcher_SUIApp.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

@main
struct Sketcher: App {
    var body: some Scene {
        WindowGroup {
            MainScreen(
				progress: Mocks.progressItems,
				recomendations: Mocks.recomendations,
                sessions: Mocks.sessions,
                spacingLevel: .level0
            )
        }
    }
}
